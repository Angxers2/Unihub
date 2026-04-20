// Changelog page — fetches CHANGELOG.md from the main repo

function ChangelogPage() {
  const h = window.TWEAKS.accentHue;
  const [state, setState] = React.useState({ loading: true, md: "", error: null });

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

  // Tiny markdown renderer (headings, lists, code, paragraphs, bold/italic/inline-code)
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

  const renderMd = (md) => {
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
        out.push(<pre key={key++} style={{ background: "rgba(0,0,0,0.35)", padding: 16, borderRadius: 10, overflowX: "auto", fontFamily: "var(--font-mono)", fontSize: 12.5, color: "var(--fg-dim)", border: "1px solid rgba(255,255,255,0.05)" }}>{buf.join("\n")}</pre>);
        continue;
      }
      const hMatch = line.match(/^(#{1,6})\s+(.+)$/);
      if (hMatch) {
        const level = hMatch[1].length;
        const content = hMatch[2];
        const sizes = ["clamp(2.5rem,5vw,3.5rem)", "clamp(1.6rem,3vw,2.2rem)", "1.3rem", "1.15rem", "1rem", "0.95rem"];
        const mt = level === 1 ? 0 : level === 2 ? 40 : 24;
        out.push(
          <div key={key++} style={{ fontFamily: "var(--font-display)", fontSize: sizes[level-1], lineHeight: 1.1, letterSpacing: "-0.02em", marginTop: mt, marginBottom: 16, color: "var(--fg)", fontStyle: level <= 2 ? "italic" : "normal" }}>
            {renderInline(content)}
          </div>
        );
        if (level <= 2) out.push(<div key={key++} style={{ height: 1, background: "rgba(255,255,255,0.06)", marginBottom: 20 }}/>);
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
          <ul key={key++} style={{ listStyle: "none", padding: 0, margin: "8px 0 16px 0" }}>
            {items.map((it, j) => (
              <li key={j} style={{ display: "flex", gap: 12, alignItems: "flex-start", padding: "6px 0", fontFamily: "var(--font-body)", color: "var(--fg-dim)", fontSize: 14.5, lineHeight: 1.6 }}>
                <span style={{ color: accent(h, 70), marginTop: 8, flexShrink: 0 }}>▸</span>
                <span>{renderInline(it)}</span>
              </li>
            ))}
          </ul>
        );
        continue;
      }
      if (line.trim() === "") { i++; continue; }
      out.push(<p key={key++} style={{ fontFamily: "var(--font-body)", color: "var(--fg-dim)", fontSize: 14.5, lineHeight: 1.7, margin: "0 0 14px 0" }}>{renderInline(line)}</p>);
      i++;
    }
    return out;
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

        <div className="rounded-[20px] p-8 md:p-10" style={{ background: "linear-gradient(180deg, rgba(18,18,20,0.9), rgba(12,12,14,0.9))", border: "1px solid rgba(255,255,255,0.06)" }}>
          {state.loading && (
            <div className="flex items-center gap-3" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-mono)", fontSize: 12 }}>
              <span className="w-2 h-2 rounded-full animate-pulse" style={{ background: accent(h, 65) }}/>
              Fetching CHANGELOG.md from main…
            </div>
          )}
          {!state.loading && state.error === "not-found" && (
            <div style={{ fontFamily: "var(--font-body)" }}>
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
            <div style={{ color: "var(--fg-dim)", fontFamily: "var(--font-body)", fontSize: 14 }}>Couldn't reach the repo right now. Try again in a minute.</div>
          )}
          {!state.loading && !state.error && (
            <div>{renderMd(state.md)}</div>
          )}
        </div>
      </div>
    </div>
  );
}

Object.assign(window, { ChangelogPage });
