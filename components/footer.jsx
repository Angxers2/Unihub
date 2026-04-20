// Cinematic footer + Tweaks panel

function Footer({ onNavigate }) {
  const h = window.TWEAKS.accentHue;
  const marqueeItems = ["Weekly updates", "Transparent code", "Free forever", "Community built", "Universal support"];
  const scrollToTop = () => {
    const el = document.getElementById("scroll-root");
    el?.scrollTo({ top: 0, behavior: "smooth" });
  };
  return (
    <footer className="relative w-full overflow-hidden" style={{ fontFamily: "var(--font-body)" }}>
      <Aurora hue={h} intensity={0.7}/>
      {/* diagonal marquee */}
      <div className="relative z-10 -rotate-[2deg] scale-110 my-12" style={{ borderTop: "1px solid rgba(255,255,255,0.05)", borderBottom: "1px solid rgba(255,255,255,0.05)", background: "rgba(10,10,11,0.5)", backdropFilter: "blur(10px)" }}>
        <div className="flex overflow-hidden py-4 whitespace-nowrap">
          <div className="flex items-center gap-10 animate-footer-marquee" style={{ paddingRight: "2.5rem" }}>
            {[...marqueeItems, ...marqueeItems, ...marqueeItems].map((t, i) => (
              <span key={i} className="flex items-center gap-10 text-[11px] tracking-[0.3em] uppercase font-bold" style={{ color: "var(--fg-dim)" }}>
                {t} <span style={{ color: accent(h, 72) }}>✦</span>
              </span>
            ))}
          </div>
        </div>
      </div>

      {/* Giant background text */}
      <div className="relative w-full">
        <div className="absolute left-1/2 -translate-x-1/2 bottom-0 pointer-events-none select-none whitespace-nowrap" style={{
          fontSize: "22vw", lineHeight: 0.75, fontWeight: 800, letterSpacing: "-0.06em",
          fontFamily: "var(--font-display)",
          fontStyle: "italic",
          WebkitTextStroke: "1px rgba(255,255,255,0.05)",
          color: "transparent",
          background: `linear-gradient(180deg, ${accent(h, 55, 0.12)} 0%, transparent 70%)`,
          WebkitBackgroundClip: "text",
          backgroundClip: "text",
          zIndex: 0,
        }}>
          Universal
        </div>

        <div className="relative z-10 max-w-5xl mx-auto px-6 pt-16 pb-10 text-center">
          <h2 className="text-[clamp(3rem,8vw,6rem)] leading-[0.95] tracking-[-0.03em]" style={{ fontFamily: "var(--font-display)" }}>
            <span style={{ color: "var(--fg)" }}>Ready to</span> <span style={{ fontStyle: "italic", color: accent(h, 72) }}>begin?</span>
          </h2>
          <div className="flex flex-wrap justify-center gap-3 mt-10">
            <Pill variant="solid" hue={h} size="lg" onClick={() => onNavigate("home")} iconRight={<Icon.Arrow width="13" height="13"/>}>Get the Script</Pill>
            <Pill variant="glass" size="lg" icon={<Icon.Discord width="14" height="14"/>} onClick={() => onNavigate("support")}>Join Discord</Pill>
          </div>
          <div className="flex flex-wrap justify-center gap-2 mt-5">
            <Pill variant="ghost" size="sm">Status</Pill>
          </div>
        </div>

        <div className="relative z-10 max-w-7xl mx-auto px-6 pt-8 pb-8 flex flex-col md:flex-row items-center justify-between gap-5" style={{ borderTop: "1px solid rgba(255,255,255,0.05)" }}>
          <div className="text-[10.5px] tracking-[0.2em] uppercase order-2 md:order-1" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-mono)" }}>© 2026 Universal Hub · All rights reserved</div>
          <div className="order-1 md:order-2 inline-flex items-center gap-2 px-5 py-2.5 rounded-full" style={{ background: "rgba(255,255,255,0.02)", border: "1px solid rgba(255,255,255,0.06)" }}>
            <span className="text-[10px] tracking-[0.2em] uppercase" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-mono)" }}>Crafted with</span>
            <span className="animate-footer-heart text-[14px]" style={{ color: accent(0, 65) }}>♥</span>
            <span className="text-[10px] tracking-[0.2em] uppercase" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-mono)" }}>by</span>
            <span className="text-[12px] font-semibold">Angxers</span>
          </div>
          <button onClick={scrollToTop} className="order-3 w-11 h-11 rounded-full flex items-center justify-center cursor-pointer transition-colors hover:text-white" style={{ background: "rgba(255,255,255,0.03)", border: "1px solid rgba(255,255,255,0.08)", color: "var(--fg-dim)" }}>
            <Icon.Up width="16" height="16"/>
          </button>
        </div>
      </div>
    </footer>
  );
}

// Tweaks panel
function TweaksPanel({ open, values, onChange, onClose }) {
  if (!open) return null;
  const fontOptions = [
    { d: "Instrument Serif", b: "Geist" },
    { d: "Fraunces", b: "Geist" },
    { d: "DM Serif Display", b: "Inter" },
    { d: "Playfair Display", b: "Plus Jakarta Sans" },
  ];
  return (
    <div className="fixed bottom-6 right-6 z-[100] w-[300px] rounded-2xl p-5" style={{ background: "rgba(14,14,16,0.95)", border: "1px solid rgba(255,255,255,0.08)", boxShadow: "0 30px 80px rgba(0,0,0,0.6)", backdropFilter: "blur(20px)", fontFamily: "var(--font-body)" }}>
      <div className="flex items-center justify-between mb-4">
        <div className="text-[13px] font-semibold tracking-tight">Tweaks</div>
        <button onClick={onClose} className="text-[11px]" style={{ color: "var(--fg-dim)" }}>×</button>
      </div>

      <div className="mb-5">
        <div className="text-[10px] tracking-[0.18em] uppercase mb-2" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-mono)" }}>Accent hue · {values.accentHue}°</div>
        <input type="range" min="0" max="360" value={values.accentHue} onChange={(e) => onChange("accentHue", parseInt(e.target.value))} className="w-full" style={{ accentColor: accent(values.accentHue, 70) }}/>
        <div className="h-2 mt-1 rounded-full" style={{ background: "linear-gradient(90deg, oklch(70% 0.2 0), oklch(70% 0.2 60), oklch(70% 0.2 120), oklch(70% 0.2 180), oklch(70% 0.2 240), oklch(70% 0.2 300), oklch(70% 0.2 360))" }}/>
      </div>

      <div className="mb-5">
        <div className="text-[10px] tracking-[0.18em] uppercase mb-2" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-mono)" }}>Font pairing</div>
        <div className="space-y-1.5">
          {fontOptions.map(f => (
            <button key={f.d} onClick={() => { onChange("displayFont", f.d); onChange("bodyFont", f.b); }} className="w-full text-left px-3 py-2 rounded-lg text-[12px]" style={{ background: values.displayFont === f.d ? "rgba(255,255,255,0.05)" : "transparent", border: `1px solid ${values.displayFont === f.d ? "rgba(255,255,255,0.1)" : "rgba(255,255,255,0.04)"}` }}>
              <span style={{ fontFamily: f.d, fontStyle: "italic", fontSize: 15 }}>{f.d}</span>
              <span style={{ color: "var(--fg-dim)" }}> + {f.b}</span>
            </button>
          ))}
        </div>
      </div>

      <div className="flex items-center justify-between">
        <div className="text-[10px] tracking-[0.18em] uppercase" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-mono)" }}>Grain overlay</div>
        <button onClick={() => onChange("grain", !values.grain)} className="w-10 h-5 rounded-full relative transition" style={{ background: values.grain ? accent(values.accentHue, 60) : "rgba(255,255,255,0.1)" }}>
          <div className="w-4 h-4 rounded-full bg-white absolute top-0.5 transition-all" style={{ left: values.grain ? "22px" : "2px" }}/>
        </button>
      </div>
    </div>
  );
}

Object.assign(window, { Footer, TweaksPanel });
