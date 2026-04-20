// Changelog page — fetches CHANGELOG.md from the main repo, renders each ## section as its own card

function ChangelogPage() {
  const h = window.TWEAKS.accentHue;
  const [state, setState] = React.useState({ loading: true, md: "", error: null });
  const [openSet, setOpenSet] = React.useState(new Set([0]));
  const [showAll, setShowAll] = React.useState(false);
  const INITIAL_VISIBLE = 4;

  React.useEffect(() => {
    (async () => {
      try {
        const r = await fetch("https://raw.githubusercontent.com/Angxers2/Unihub/main/CHANGELOG.md", { cache: "no-cache" });
        if (!r.ok) {
          setState({ loading: false, md: "", error: r.status === 404 ? "not-found" : "error" });
          return;
        }
        const txt = await r.text();
        setState({ loading: false, md: txt, error: null });
      } catch {
        setState({ loading: false, md: "", error: "error" });
      }
    })();
  }, []);

  const renderInline = (s) => {
    const parts = [];
    let rest = s;
    let key = 0;
    const push = (el) => parts.push(React.cloneElement(el, { key: key++ }));
    const regex = /(`[^`]+`|\*\*[^*]+\*\*|\*[^*]+\*|\[[^\]]+\]\([^)]+\))/;
    while (rest.length) {
      const m = rest.match(regex);
      if (!m) { push(<span>{rest}</span>); break; }
      if (m.index > 0) push(<span>{rest.slice(0, m.index)}</span>);
      const tok = m[0];
      if (tok.startsWith("`")) push(<code style={{ background: "rgba(255,255,255,0.06)", padding: "2px 6px", borderRadius: 4, fontFamily: "var(--font-mono)", fontSize: "0.9em" }}>{tok.slice(1,-1)}</code>);
      else if (tok.startsWith("**")) push(<strong style={{ color: "var(--fg)" }}>{tok.slice(2,-2)}</strong>);
      else if (tok.startsWith("*")) push(<em>{tok.slice(1,-1)}</em>);
      else { const lm = tok.match(/\[([^\]]+)\]\(([^)]+)\)/); push(<a href={lm[2]} target="_blank" rel="noopener" style={{ color: accent(h, 75), textDecoration: "underline" }}>{lm[1]}</a>); }
      rest = rest.slice(m.index + tok.length);
    }
    return parts;
  };

  // Renders h3+/lists/code/paragraphs only — h1 and h2 are handled separately at the section level
  const renderBlocks = (md) => {
    const lines = md.split("\n");
    const out = [];
    let i = 0;
    let key = 0;
    while (i < lines.length) {
      const line = lines[i];
      if (line.startsWith("```")) {
        const buf = [];
        i++;
        while (i < lines.length && !lines[i].startsWith("```")) { buf.push(lines[i]); i++; }
        i++;
        out.push(<pre key={key++} style={{ background: "rgba(0,0,0,0.35)", padding: 14, borderRadius: 10, overflowX: "auto", fontFamily: "var(--font-mono)", fontSize: 12.5, color: "var(--fg-dim)", border: "1px solid rgba(255,255,255,0.05)", margin: "8px 0 14px" }}>{buf.join("\n")}</pre>);
        continue;
      }
      const hMatch = line.match(/^(#{3,6})\s+(.+)$/);
      if (hMatch) {
        const content = hMatch[2];
        out.push(
          <div key={key++} style={{ fontFamily: "var(--font-mono)", fontSize: 10.5, letterSpacing: "0.18em", textTransform: "uppercase", color: accent(h, 75), marginTop: 14, marginBottom: 8 }}>
            {renderInline(content)}
          </div>
        );
        i++;
        continue;
      }
      if (/^[-*]\s+/.test(line)) {
        const items = [];
        while (i < lines.length && /^[-*]\s+/.test(lines[i])) {
          items.push(lines[i].replace(/^[-*]\s+/, ""));
          i++;
        }
        out.push(
          <ul key={key++} style={{ listStyle: "none", padding: 0, margin: "4px 0 10px 0" }}>
            {items.map((it, j) => (
              <li key={j} style={{ display: "flex", gap: 12, alignItems: "flex-start", padding: "4px 0", fontFamily: "var(--font-body)", color: "var(--fg-dim)", fontSize: 14, lineHeight: 1.6 }}>
                <span style={{ color: accent(h, 70), marginTop: 7, flexShrink: 0, fontSize: 12 }}>▸</span>
                <span>{renderInline(it)}</span>
              </li>
            ))}
          </ul>
        );
        continue;
      }
      if (line.trim() === "") { i++; continue; }
      out.push(<p key={key++} style={{ fontFamily: "var(--font-body)", color: "var(--fg-dim)", fontSize: 14, lineHeight: 1.7, margin: "0 0 10px 0" }}>{renderInline(line)}</p>);
      i++;
    }
    return out;
  };

  // Split md into { preamble, entries[] }; preamble is everything before the first ## heading
  const parseEntries = (md) => {
    const lines = md.split("\n");
    const preamble = [];
    const entries = [];
    let current = null;
    for (const line of lines) {
      const m = line.match(/^##\s+(.+)$/);
      if (m) {
        if (current) entries.push(current);
        const heading = m[1].trim();
        const dm = heading.match(/^(\d{4}-\d{2}-\d{2})\s*[—–-]\s*(.+)$/);
        current = {
          raw: heading,
          date: dm ? dm[1] : null,
          title: dm ? dm[2] : heading,
          lines: [],
        };
      } else if (current) {
        current.lines.push(line);
      } else if (!line.match(/^#\s+/)) {
        preamble.push(line);
      }
    }
    if (current) entries.push(current);
    return { preamble: preamble.join("\n").trim(), entries };
  };

  const MONTHS = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
  const fmtDate = (iso) => {
    if (!iso) return null;
    const [y, m, d] = iso.split("-").map(Number);
    if (!y || !m || !d) return iso;
    return { mon: MONTHS[m-1], day: d, year: y };
  };

  // Count changed-bullet points so the collapsed header can show "N changes"
  const countChanges = (lines) => lines.filter(l => /^[-*]\s+/.test(l)).length;

  const toggle = (i) => {
    setOpenSet(prev => {
      const s = new Set(prev);
      if (s.has(i)) s.delete(i); else s.add(i);
      return s;
    });
  };

  const { preamble, entries } = parseEntries(state.md);
  const visibleEntries = showAll ? entries : entries.slice(0, INITIAL_VISIBLE);
  const hiddenCount = entries.length - visibleEntries.length;

  const EntryCard = ({ entry, open, index }) => {
    const d = fmtDate(entry.date);
    const changes = countChanges(entry.lines);
    return (
      <div className="rounded-[16px] overflow-hidden transition-colors" style={{ background: open ? "linear-gradient(180deg, rgba(20,20,22,0.9), rgba(14,14,16,0.9))" : "rgba(18,18,20,0.6)", border: `1px solid ${open ? "rgba(255,255,255,0.08)" : "rgba(255,255,255,0.05)"}` }}>
        <button onClick={() => toggle(index)} className="w-full flex items-center gap-5 px-5 py-4 text-left cursor-pointer" style={{ fontFamily: "var(--font-body)" }}>
          {d ? (
            <div className="flex flex-col items-center justify-center w-14 shrink-0 rounded-lg py-1.5" style={{ background: "rgba(255,255,255,0.03)", border: "1px solid rgba(255,255,255,0.06)" }}>
              <div className="text-[10px] tracking-[0.18em] uppercase" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-mono)" }}>{d.mon}</div>
              <div className="text-[20px] leading-none mt-0.5" style={{ fontFamily: "var(--font-display)", color: "var(--fg)" }}>{d.day}</div>
              <div className="text-[9px] tracking-[0.15em] uppercase mt-0.5" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-mono)" }}>{d.year}</div>
            </div>
          ) : null}
          <div className="flex-1 min-w-0">
            <div className="text-[15px] font-medium tracking-tight truncate" style={{ color: "var(--fg)" }}>{entry.title}</div>
            {!open && changes > 0 && (
              <div className="text-[11.5px] mt-0.5" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-mono)" }}>{changes} {changes === 1 ? "change" : "changes"}</div>
            )}
          </div>
          <div className="shrink-0 w-6 h-6 rounded-full flex items-center justify-center transition-transform" style={{ background: "rgba(255,255,255,0.04)", border: "1px solid rgba(255,255,255,0.06)", color: "var(--fg-dim)", transform: open ? "rotate(180deg)" : "rotate(0deg)" }}>
            <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round"><polyline points="6 9 12 15 18 9"/></svg>
          </div>
        </button>
        {open && (
          <div className="px-5 pb-5" style={{ borderTop: "1px solid rgba(255,255,255,0.05)" }}>
            <div className="pt-3">{renderBlocks(entry.lines.join("\n"))}</div>
          </div>
        )}
      </div>
    );
  };

  return (
    <div className="relative w-full min-h-screen pt-20 pb-32 px-6" data-screen-label="07 Changelog">
      <Aurora hue={h} intensity={0.5}/>
      <div className="relative z-10 max-w-3xl mx-auto">
        <div className="text-center mb-14">
          <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full text-[11px] font-semibold tracking-[0.16em] uppercase mb-6" style={{ background: accentSoft(h), border: `1px solid ${accentBorder(h)}`, color: accent(h, 78), fontFamily: "var(--font-mono)" }}>From the main repo</div>
          <h1 className="text-[clamp(3rem,8vw,6rem)] leading-[0.95] tracking-[-0.03em]" style={{ fontFamily: "var(--font-display)" }}>
            <span style={{ color: "var(--fg)" }}>What's</span> <span style={{ fontStyle: "italic", color: accent(h, 72) }}>new.</span>
          </h1>
        </div>

        {state.loading && (
          <div className="rounded-[16px] p-6 flex items-center gap-3" style={{ background: "rgba(18,18,20,0.6)", border: "1px solid rgba(255,255,255,0.05)", color: "var(--fg-dim)", fontFamily: "var(--font-mono)", fontSize: 12 }}>
            <span className="w-2 h-2 rounded-full animate-pulse" style={{ background: accent(h, 65) }}/>
            Fetching CHANGELOG.md from main…
          </div>
        )}

        {!state.loading && state.error === "not-found" && (
          <div className="rounded-[20px] p-8" style={{ background: "linear-gradient(180deg, rgba(20,20,22,0.9), rgba(14,14,16,0.9))", border: "1px solid rgba(255,255,255,0.06)", fontFamily: "var(--font-body)" }}>
            <div className="text-[20px] mb-2" style={{ fontFamily: "var(--font-display)", fontStyle: "italic" }}>No changelog yet.</div>
            <p style={{ color: "var(--fg-dim)", fontSize: 14.5, lineHeight: 1.7 }}>
              <code style={{ background: "rgba(255,255,255,0.05)", padding: "2px 6px", borderRadius: 4, fontFamily: "var(--font-mono)", fontSize: "0.9em" }}>CHANGELOG.md</code> hasn't been added to the main repo yet. Once it's there, this page will automatically render it.
            </p>
            <div className="mt-5">
              <Pill variant="glass" size="sm" icon={<Icon.External width="12" height="12"/>} as="a" href="https://github.com/Angxers2/Unihub/tree/main" target="_blank">View repo</Pill>
            </div>
          </div>
        )}

        {!state.loading && state.error === "error" && (
          <div className="rounded-[16px] p-6" style={{ background: "rgba(18,18,20,0.6)", border: "1px solid rgba(255,255,255,0.05)", color: "var(--fg-dim)", fontFamily: "var(--font-body)", fontSize: 14 }}>
            Couldn't reach the repo right now. Try again in a minute.
          </div>
        )}

        {!state.loading && !state.error && entries.length === 0 && (
          <div className="rounded-[20px] p-8" style={{ background: "linear-gradient(180deg, rgba(20,20,22,0.9), rgba(14,14,16,0.9))", border: "1px solid rgba(255,255,255,0.06)" }}>
            {renderBlocks(preamble || state.md)}
          </div>
        )}

        {!state.loading && !state.error && entries.length > 0 && (
          <div className="flex flex-col gap-3">
            {preamble && (
              <p style={{ fontFamily: "var(--font-body)", color: "var(--fg-dim)", fontSize: 14, lineHeight: 1.7, margin: "0 0 8px 0", textAlign: "center" }}>
                {renderInline(preamble.split("\n").filter(l => l.trim())[0] || "")}
              </p>
            )}
            {visibleEntries.map((entry, i) => (
              <EntryCard key={i} entry={entry} open={openSet.has(i)} index={i}/>
            ))}
            {hiddenCount > 0 && (
              <button onClick={() => setShowAll(true)} className="self-center mt-3 px-5 py-2 rounded-full text-[12px] tracking-[0.12em] uppercase cursor-pointer transition-colors" style={{ background: "rgba(255,255,255,0.03)", border: "1px solid rgba(255,255,255,0.08)", color: "var(--fg-dim)", fontFamily: "var(--font-mono)" }}>
                Show {hiddenCount} older {hiddenCount === 1 ? "entry" : "entries"}
              </button>
            )}
          </div>
        )}
      </div>
    </div>
  );
}

Object.assign(window, { ChangelogPage });
