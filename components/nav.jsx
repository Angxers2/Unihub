// Nav bar

function Nav({ page, setPage }) {
  const tabs = [
    { id: "home", label: "Home" },
    { id: "lite", label: "Lite" },
    { id: "showcase", label: "Showcase" },
    { id: "games", label: "Supported Games" },
    { id: "legacy", label: "Legacy Versions" },
    { id: "support", label: "Support" },
  ];
  const h = window.TWEAKS.accentHue;
  const [status, setStatus] = React.useState({ main: null, lite: null });

  React.useEffect(() => {
    // Check a branch has a real Lua payload. Accepts .lua files OR any file with Lua-shaped
    // content (since the Lite branch stores its script without an extension).
    const checkBranch = async (branch) => {
      try {
        const r = await fetch(`https://api.github.com/repos/Angxers2/Unihub/contents?ref=${branch}`, { cache: "no-cache" });
        if (!r.ok) return false;
        const arr = await r.json();
        if (!Array.isArray(arr)) return false;
        // Any sizeable non-markdown/non-image file counts as a script payload
        return arr.some(e => {
          if (e.type !== "file") return false;
          if (e.size < 1000) return false;
          const n = e.name?.toLowerCase() || "";
          if (n.endsWith(".md") || n.endsWith(".png") || n.endsWith(".jpg") || n.endsWith(".gif") || n.endsWith(".json")) return false;
          return true;
        });
      } catch { return false; }
    };
    (async () => {
      const [main, lite] = await Promise.all([checkBranch("main"), checkBranch("lite")]);
      setStatus({ main, lite });
    })();
  }, []);

  const Dot = ({ live }) => (
    <span className="w-1.5 h-1.5 rounded-full" style={{
      background: live === null ? "oklch(70% 0.01 280)" : live ? "oklch(72% 0.17 150)" : "oklch(65% 0.2 25)",
      boxShadow: live ? "0 0 8px oklch(72% 0.17 150)" : "none",
      transition: "background 0.3s"
    }}/>
  );

  return (
    <nav className="sticky top-0 z-50 w-full" style={{ fontFamily: "var(--font-body)" }}>
      <div className="absolute inset-0 backdrop-blur-xl" style={{ background: "linear-gradient(180deg, rgba(10,10,11,0.85) 0%, rgba(10,10,11,0.5) 100%)", borderBottom: "1px solid rgba(255,255,255,0.05)" }} />
      <div className="relative max-w-7xl mx-auto px-6 py-4 flex items-center justify-between">
        <button onClick={() => setPage("home")} className="flex items-center group">
          <img src="favicon.png" alt="Universal Hub" className="w-12 h-12 object-contain"/>
        </button>
        <div className="hidden md:flex items-center gap-1 p-1 rounded-full" style={{ background: "rgba(255,255,255,0.02)", border: "1px solid rgba(255,255,255,0.05)" }}>
          {tabs.map((t) => (
            <button
              key={t.id}
              onClick={() => setPage(t.id)}
              className="relative px-4 py-1.5 rounded-full text-[12.5px] font-medium transition-colors"
              style={{ color: page === t.id ? "var(--fg)" : "var(--fg-dim)" }}
            >
              {page === t.id && (
                <div className="absolute inset-0 rounded-full" style={{ background: "rgba(255,255,255,0.06)", border: "1px solid rgba(255,255,255,0.08)" }} />
              )}
              <span className="relative">{t.label}</span>
            </button>
          ))}
        </div>
        <div className="flex items-center gap-2">
          <div className="hidden sm:flex items-center gap-3 px-3 py-1.5 rounded-full text-[11px]" style={{ background: "rgba(255,255,255,0.03)", border: "1px solid rgba(255,255,255,0.06)", color: "var(--fg-dim)", fontFamily: "var(--font-mono)" }}>
            <span className="flex items-center gap-1.5"><Dot live={status.main}/> Main</span>
            <span style={{ opacity: 0.3 }}>·</span>
            <span className="flex items-center gap-1.5"><Dot live={status.lite}/> Lite</span>
          </div>
        </div>
      </div>
    </nav>
  );
}

Object.assign(window, { Nav });
