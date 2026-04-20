// Home + Lite pages — script hero cards
const { useState: useStateH, useRef: useRefH, useEffect: useEffectH } = React;

function ScriptCard({ title, version, script, hue, accentLabel, lastUpdated }) {
  const [copied, setCopied] = useState(false);
  const cardRef = useRef(null);
  const [mouse, setMouse] = useState({ x: 50, y: 50, active: false, rx: 0, ry: 0 });
  const copy = () => {
    navigator.clipboard?.writeText(script);
    setCopied(true);
    setTimeout(() => setCopied(false), 1800);
  };
  const onMove = (e) => {
    const r = cardRef.current.getBoundingClientRect();
    const x = ((e.clientX - r.left) / r.width) * 100;
    const y = ((e.clientY - r.top) / r.height) * 100;
    const ry = ((e.clientX - r.left) / r.width - 0.5) * 6;
    const rx = -((e.clientY - r.top) / r.height - 0.5) * 4;
    setMouse({ x, y, active: true, rx, ry });
  };
  const onLeave = () => setMouse(m => ({ ...m, active: false, rx: 0, ry: 0 }));
  return (
    <div className="relative w-full max-w-2xl mx-auto" style={{ perspective: "1200px" }}>
      <div className="absolute -inset-px rounded-[28px] opacity-40" style={{ background: "linear-gradient(135deg, rgba(255,255,255,0.08), transparent 60%)", filter: "blur(20px)" }} />
      <div
        ref={cardRef}
        onMouseMove={onMove}
        onMouseLeave={onLeave}
        className="relative rounded-[24px] overflow-hidden group"
        style={{
          background: "linear-gradient(180deg, rgba(20,20,22,0.9), rgba(14,14,16,0.9))",
          border: "1px solid rgba(255,255,255,0.06)",
          boxShadow: "0 30px 80px -20px rgba(0,0,0,0.6), inset 0 1px 0 rgba(255,255,255,0.04)",
          transform: `rotateX(${mouse.rx}deg) rotateY(${mouse.ry}deg)`,
          transition: "transform 0.3s cubic-bezier(0.16,1,0.3,1)",
          transformStyle: "preserve-3d",
        }}
      >
        {/* Spotlight layer */}
        <div
          className="pointer-events-none absolute inset-0 transition-opacity duration-300"
          style={{
            opacity: mouse.active ? 1 : 0,
            background: `radial-gradient(400px circle at ${mouse.x}% ${mouse.y}%, rgba(255,255,255,0.08), transparent 40%)`,
          }}
        />
        {/* Border highlight */}
        <div
          className="pointer-events-none absolute inset-0 rounded-[24px] transition-opacity duration-300"
          style={{
            opacity: mouse.active ? 1 : 0,
            background: `radial-gradient(300px circle at ${mouse.x}% ${mouse.y}%, rgba(255,255,255,0.08), transparent 40%)`,
            mask: "linear-gradient(#000, #000) content-box, linear-gradient(#000, #000)",
            WebkitMask: "linear-gradient(#000, #000) content-box, linear-gradient(#000, #000)",
            maskComposite: "exclude",
            WebkitMaskComposite: "xor",
            padding: "1px",
          }}
        />
        {/* header */}
        <div className="relative flex items-center justify-between px-5 py-3.5" style={{ borderBottom: "1px solid rgba(255,255,255,0.05)" }}>
          <div className="flex items-center gap-2.5">
            <div className="flex gap-1.5">
              <span className="w-2.5 h-2.5 rounded-full" style={{ background: "rgba(255,255,255,0.12)" }} />
              <span className="w-2.5 h-2.5 rounded-full" style={{ background: "rgba(255,255,255,0.12)" }} />
              <span className="w-2.5 h-2.5 rounded-full" style={{ background: "rgba(255,255,255,0.2)" }} />
            </div>
            <span className="text-[11.5px] tracking-[0.14em] uppercase" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-mono)" }}>{title}</span>
          </div>
          <span className="px-2.5 py-1 rounded-full text-[10.5px] font-semibold tracking-wider uppercase" style={{ background: "rgba(255,255,255,0.04)", color: "var(--fg)", border: "1px solid rgba(255,255,255,0.08)", fontFamily: "var(--font-mono)" }}>{version}{lastUpdated ? ` · ${lastUpdated}` : ""}</span>
        </div>
        {/* code */}
        <div className="relative px-6 py-6">
          <pre className="text-[13px] leading-[1.7] overflow-x-auto whitespace-pre-wrap break-all" style={{ fontFamily: "var(--font-mono)", color: "var(--fg-dim)" }}>
            <span style={{ color: "var(--fg)" }}>loadstring</span>
            <span>(</span>
            <span style={{ color: "oklch(72% 0.14 200)" }}>game</span>
            <span style={{ color: "var(--fg)" }}>:</span>
            <span style={{ color: "oklch(78% 0.12 80)" }}>HttpGet</span>
            <span>(</span>
            <span style={{ color: "oklch(72% 0.15 150)" }}>{`"${script}"`}</span>
            <span>))()</span>
          </pre>
        </div>
        {/* actions */}
        <div className="relative flex items-center gap-3 px-6 pb-6">
          <Pill variant="solid" hue={hue} size="md" onClick={copy} icon={copied ? <Icon.Check width="14" height="14"/> : <Icon.Copy width="14" height="14"/>}>
            {copied ? "Copied" : "Copy Script"}
          </Pill>
          <Pill variant="glass" size="md" icon={<Icon.Code width="14" height="14"/>} iconRight={<Icon.External width="12" height="12"/>} onClick={() => script && window.open(script, "_blank", "noopener,noreferrer")}>View Source</Pill>
          <div className="ml-auto text-[11px]" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-mono)" }}>~{script.length} chars</div>
        </div>
      </div>
    </div>
  );
}

function FeatureRow({ hue }) {
  const feats = [
    { icon: <Icon.Bolt width="14" height="14"/>, label: "Works in every game" },
    { icon: <Icon.Shield width="14" height="14"/>, label: "Clean, transparent code" },
    { icon: <Icon.Sparkle width="14" height="14"/>, label: "Regular updates" },
  ];
  return (
    <div className="flex flex-wrap justify-center gap-2 mt-8">
      {feats.map((f, i) => (
        <div key={i} className="inline-flex items-center gap-2 px-3.5 py-1.5 rounded-full text-[12px]" style={{ background: "rgba(255,255,255,0.02)", border: "1px solid rgba(255,255,255,0.06)", color: "var(--fg-dim)", fontFamily: "var(--font-body)" }}>
            <span style={{ color: "var(--fg)" }}>{f.icon}</span>
            {f.label}
        </div>
      ))}
    </div>
  );
}

// Reads manifest.json from the main branch. Edit the JSON on GitHub to update the site.
window.__unihubManifestPromise = window.__unihubManifestPromise || null;
function useUnihubBuild(key) {
  const [build, setBuild] = useState(null);
  useEffect(() => {
    let cancelled = false;
    (async () => {
      try {
        if (!window.__unihubManifestPromise) {
          window.__unihubManifestPromise = fetch("https://raw.githubusercontent.com/Angxers2/Unihub/main/manifest.json", { cache: "no-cache" })
            .then(r => r.ok ? r.json() : Promise.reject(r.status));
        }
        const manifest = await window.__unihubManifestPromise;
        const entry = manifest?.[key];
        if (!entry || cancelled) return;
        setBuild({ version: `v${entry.version}`, script: entry.script, updated: entry.updated || "" });
      } catch {}
    })();
    return () => { cancelled = true; };
  }, [key]);
  return build;
}

function HomePage({ setPage }) {
  const h = window.TWEAKS.accentHue;
  const heroRef = useRef(null);
  const [scrollT, setScrollT] = useState(0);
  const build = useUnihubBuild("main");

  useEffect(() => {
    const onScroll = () => {
      if (!heroRef.current) return;
      const r = heroRef.current.getBoundingClientRect();
      const total = r.height + window.innerHeight;
      const progress = Math.max(0, Math.min(1, (window.innerHeight - r.top) / total));
      setScrollT(progress);
    };
    const container = document.getElementById("scroll-root");
    container?.addEventListener("scroll", onScroll);
    onScroll();
    return () => container?.removeEventListener("scroll", onScroll);
  }, []);

  const rotate = 12 - scrollT * 14;
  const scale = 0.92 + scrollT * 0.08;
  const translateY = (1 - scrollT) * 40;

  return (
    <div className="relative w-full min-h-screen pt-20 pb-32 px-6" data-screen-label="01 Home">
      <Aurora hue={h} />
      <div className="relative z-10 max-w-6xl mx-auto">
        <div className="flex flex-col items-center text-center">
          <h1 data-hero-title className="text-[clamp(3.5rem,10vw,7.5rem)] leading-[0.95] tracking-[-0.03em] font-normal" style={{ fontFamily: "var(--font-display)" }}>
            <span style={{ background: `linear-gradient(180deg, var(--fg) 0%, ${accent(h, 60, 0.7)} 100%)`, WebkitBackgroundClip: "text", WebkitTextFillColor: "transparent", backgroundClip: "text" }}>Universal</span>
            <br />
            <span style={{ fontStyle: "italic", color: accent(h, 72) }}>Hub.</span>
          </h1>
          <p className="mt-6 max-w-xl text-[17px] leading-relaxed" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-body)" }}>
            A versatile Roblox script that works in every game, with expanded feature sets in select popular ones. Lightweight, transparent, and updated often.
          </p>
          <div className="flex items-center gap-3 mt-8">
            <Pill variant="solid" hue={h} size="lg" iconRight={<Icon.Arrow width="14" height="14"/>} onClick={() => {
              const el = document.getElementById("scroll-root");
              const card = document.querySelector("[data-hero-card]");
              if (card && el) el.scrollTo({ top: card.getBoundingClientRect().top + el.scrollTop - 120, behavior: "smooth" });
            }}>Get the Script</Pill>
            <Pill variant="glass" size="lg" icon={<Icon.Play width="12" height="12"/>} onClick={() => setPage && setPage("showcase")}>Watch Demo</Pill>
          </div>
          <FeatureRow hue={h} />
        </div>

        {/* Scroll-reveal hero card */}
        <div ref={heroRef} data-hero-card className="mt-24" style={{ perspective: "1400px" }}>
          <div
            style={{
              transform: `rotateX(${rotate}deg) scale(${scale}) translateY(${translateY}px)`,
              transformOrigin: "center top",
              transition: "transform 0.2s ease-out",
            }}
          >
            <ScriptCard
              title="Loadstring"
              version={build?.version || "…"}
              lastUpdated={build?.updated || ""}
              script={build?.script || ""}
              hue={h}
            />
          </div>
        </div>

        {/* Supported games strip */}
        <div className="mt-24 rounded-2xl overflow-hidden" style={{ background: "linear-gradient(180deg, rgba(18,18,20,0.9), rgba(12,12,14,0.9))", border: "1px solid rgba(255,255,255,0.06)" }}>
          <div className="px-6 py-5 flex items-center justify-between" style={{ borderBottom: "1px solid rgba(255,255,255,0.05)" }}>
            <div>
              <div className="text-[15px] font-medium tracking-tight" style={{ fontFamily: "var(--font-body)" }}>Works in every game</div>
              <div className="text-[12px] mt-0.5" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-body)" }}>Expanded feature sets for the games below.</div>
            </div>
            <span className="text-[10.5px] tracking-[0.18em] uppercase" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-mono)" }}>Featured</span>
          </div>
          <div className="grid grid-cols-2 md:grid-cols-5 gap-px" style={{ background: "rgba(255,255,255,0.04)" }}>
            {[
              { n: "Prison Life", id: 155615604 },
              { n: "Murder Mystery 2", id: 142823291 },
              { n: "Da Hood", id: 2788229376 },
              { n: "Mic Up", id: 6884319169 },
              { n: "Natural Disaster Survival", id: 189707 },
            ].map((g, i) => (
              <div key={g.n} className="px-5 py-6 flex flex-col gap-3" style={{ background: "rgba(14,14,16,0.95)" }}>
                <GameThumb id={g.id} name={g.n}/>
                <div className="text-[13px] font-medium leading-tight" style={{ fontFamily: "var(--font-body)" }}>{g.n}</div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}

function LitePage() {
  const h = 150; // emerald hue override
  const build = useUnihubBuild("lite");
  return (
    <div className="relative w-full min-h-screen pt-20 pb-32 px-6" data-screen-label="02 Lite">
      <Aurora hue={h} />
      <div className="relative z-10 max-w-6xl mx-auto flex flex-col items-center text-center">
        <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full text-[11px] font-semibold tracking-[0.16em] uppercase mb-7" style={{ background: accentSoft(h), border: `1px solid ${accentBorder(h)}`, color: accent(h, 78), fontFamily: "var(--font-mono)" }}>
          Lightweight
        </div>
        <h1 className="text-[clamp(3rem,9vw,6.5rem)] leading-[0.95] tracking-[-0.03em] font-normal" style={{ fontFamily: "var(--font-display)" }}>
          <span style={{ color: "var(--fg)" }}>Universal Hub</span>
          <br/>
          <span style={{ fontStyle: "italic", color: accent(h, 72) }}>Lite.</span>
        </h1>
        <p className="mt-6 max-w-xl text-[17px] leading-relaxed" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-body)" }}>
          A lighter build optimized for performance and stability. Smaller footprint, faster boot, fewer moving parts.
        </p>
        <div className="mt-14 w-full">
          <ScriptCard
            title="Loadstring · Lite"
            version={build?.version || "…"}
            lastUpdated={build?.updated || ""}
            script={build?.script || ""}
            hue={h}
          />
        </div>
        <div className="mt-16 grid grid-cols-1 md:grid-cols-3 gap-4 w-full max-w-4xl">
          {[
            { k: "67KB", l: "Bundle size" },
            { k: "<120ms", l: "Cold start" },
            { k: "0", l: "Dependencies" },
          ].map((s, i) => (
            <div key={i} className="rounded-2xl p-6 text-left" style={{ background: "linear-gradient(180deg, rgba(18,18,20,0.9), rgba(12,12,14,0.9))", border: "1px solid rgba(255,255,255,0.05)" }}>
              <div className="text-[32px] tracking-tight font-normal" style={{ fontFamily: "var(--font-display)", color: accent(h, 75) }}>{s.k}</div>
              <div className="text-[11.5px] mt-1 tracking-[0.12em] uppercase" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-mono)" }}>{s.l}</div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

Object.assign(window, { HomePage, LitePage, ScriptCard });
