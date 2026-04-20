// Theme tokens + shared primitives
const { useState, useEffect, useRef, useCallback, useMemo } = React;

// -----------------------------
// Tweakable defaults (persisted)
// -----------------------------
window.TWEAKS = /*EDITMODE-BEGIN*/{
  "accentHue": 35,
  "displayFont": "Instrument Serif",
  "bodyFont": "Plus Jakarta Sans",
  "grain": false
}/*EDITMODE-END*/;

// Utility: classnames
const cx = (...xs) => xs.filter(Boolean).join(" ");

// Accent color derived from hue
const accent = (h, l = 68, c = 0.19) => `oklch(${l}% ${c} ${h})`;
const accentSoft = (h) => `oklch(68% 0.19 ${h} / 0.15)`;
const accentBorder = (h) => `oklch(68% 0.19 ${h} / 0.3)`;

// Magnetic removed — replaced with plain element + CSS hover.
function Magnetic({ children, className = "", style = {}, as = "button", ...rest }) {
  const Tag = as;
  return <Tag className={className} style={style} {...rest}>{children}</Tag>;
}

// -----------------------------
// Glass pill button
// -----------------------------
function Pill({ children, variant = "glass", size = "md", hue, className = "", style = {}, icon, iconRight, ...rest }) {
  const h = hue ?? window.TWEAKS.accentHue;
  const sizes = {
    sm: "px-3.5 py-1.5 text-[12px]",
    md: "px-4 py-2 text-[13px]",
    lg: "px-5 py-2.5 text-[14px]",
  };
  const variantClass = {
    glass: "pill-glass",
    solid: "pill-solid",
    ghost: "pill-ghost",
  }[variant];
  const variantStyle = {};
  return (
    <button
      className={cx("pill inline-flex items-center gap-2 rounded-lg font-medium whitespace-nowrap cursor-pointer", variantClass, sizes[size], className)}
      style={{ fontFamily: "var(--font-body)", letterSpacing: "-0.01em", ...variantStyle, ...style }}
      {...rest}
    >
      {icon}
      <span>{children}</span>
      {iconRight}
    </button>
  );
}

// -----------------------------
// Aurora background (shared)
// -----------------------------
function Aurora({ hue, intensity = 1 }) {
  const h = hue ?? window.TWEAKS.accentHue;
  return (
    <div className="pointer-events-none absolute inset-0 overflow-hidden z-0">
      <div
        className="absolute"
        style={{
          top: "-20%", left: "10%", width: "60vw", height: "60vh",
          background: `radial-gradient(circle, ${accent(h, 55, 0.1 * intensity)} 0%, transparent 60%)`,
          filter: "blur(80px)",
        }}
      />
      <div
        className="absolute"
        style={{
          bottom: "-10%", right: "-5%", width: "45vw", height: "55vh",
          background: `radial-gradient(circle, ${accent((h + 20) % 360, 55, 0.08 * intensity)} 0%, transparent 60%)`,
          filter: "blur(100px)",
        }}
      />
      <div
        className="absolute inset-0"
        style={{
          backgroundImage: `
            linear-gradient(to right, rgba(255,255,255,0.025) 1px, transparent 1px),
            linear-gradient(to bottom, rgba(255,255,255,0.025) 1px, transparent 1px)
          `,
          backgroundSize: "80px 80px",
          maskImage: "radial-gradient(ellipse at center, black 30%, transparent 75%)",
          WebkitMaskImage: "radial-gradient(ellipse at center, black 30%, transparent 75%)",
        }}
      />
    </div>
  );
}

// -----------------------------
// Icons (simple SVG, lucide-style)
// -----------------------------
const Icon = {
  Copy: (p) => <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round" {...p}><rect x="9" y="9" width="13" height="13" rx="2"/><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"/></svg>,
  Check: (p) => <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" {...p}><polyline points="20 6 9 17 4 12"/></svg>,
  Code: (p) => <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round" {...p}><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg>,
  External: (p) => <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round" {...p}><path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"/><polyline points="15 3 21 3 21 9"/><line x1="10" y1="14" x2="21" y2="3"/></svg>,
  Play: (p) => <svg viewBox="0 0 24 24" fill="currentColor" {...p}><path d="M8 5v14l11-7z"/></svg>,
  Send: (p) => <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round" {...p}><line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/></svg>,
  Discord: (p) => <svg viewBox="0 0 24 24" fill="currentColor" {...p}><path d="M20.317 4.492c-1.53-.69-3.17-1.2-4.885-1.49a.075.075 0 0 0-.079.036c-.21.369-.444.85-.608 1.23a18.566 18.566 0 0 0-5.487 0 12.36 12.36 0 0 0-.617-1.23A.077.077 0 0 0 8.562 3c-1.714.29-3.354.8-4.885 1.491a.07.07 0 0 0-.032.027C.533 9.093-.32 13.555.099 17.961a.08.08 0 0 0 .031.055 20.03 20.03 0 0 0 5.993 2.98.078.078 0 0 0 .084-.026 13.83 13.83 0 0 0 1.226-1.963.074.074 0 0 0-.041-.104 13.2 13.2 0 0 1-1.872-.878.075.075 0 0 1-.008-.125c.126-.093.252-.19.372-.287a.075.075 0 0 1 .078-.01c3.927 1.764 8.18 1.764 12.061 0a.075.075 0 0 1 .079.009c.12.098.245.195.372.288a.075.075 0 0 1-.006.125c-.598.344-1.22.635-1.873.877a.075.075 0 0 0-.041.105c.36.687.772 1.341 1.225 1.962a.077.077 0 0 0 .084.028 19.963 19.963 0 0 0 6.002-2.981.076.076 0 0 0 .032-.054c.5-5.094-.838-9.52-3.549-13.442a.06.06 0 0 0-.031-.028zM8.02 15.278c-1.182 0-2.157-1.069-2.157-2.38 0-1.312.956-2.38 2.157-2.38 1.21 0 2.176 1.077 2.157 2.38 0 1.311-.956 2.38-2.157 2.38zm7.975 0c-1.183 0-2.157-1.069-2.157-2.38 0-1.312.955-2.38 2.157-2.38 1.21 0 2.176 1.077 2.157 2.38 0 1.311-.946 2.38-2.157 2.38z"/></svg>,
  Youtube: (p) => <svg viewBox="0 0 24 24" fill="currentColor" {...p}><path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/></svg>,
  Arrow: (p) => <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round" {...p}><line x1="7" y1="17" x2="17" y2="7"/><polyline points="7 7 17 7 17 17"/></svg>,
  Up: (p) => <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round" {...p}><path d="M5 10l7-7m0 0l7 7m-7-7v18"/></svg>,
  Sparkle: (p) => <svg viewBox="0 0 24 24" fill="currentColor" {...p}><path d="M12 2l1.5 5.5L19 9l-5.5 1.5L12 16l-1.5-5.5L5 9l5.5-1.5L12 2z"/></svg>,
  Bolt: (p) => <svg viewBox="0 0 24 24" fill="currentColor" {...p}><path d="M13 2L3 14h7l-1 8 10-12h-7l1-8z"/></svg>,
  Shield: (p) => <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round" {...p}><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>,
  Dot: (p) => <svg viewBox="0 0 24 24" fill="currentColor" {...p}><circle cx="12" cy="12" r="4"/></svg>,
};

// Roblox thumbnail fetcher — uses public thumbnails.roblox.com API
window.__robloxThumbCache = window.__robloxThumbCache || {};
function useRobloxThumb(placeId) {
  const [url, setUrl] = React.useState(placeId ? window.__robloxThumbCache[placeId] || null : null);
  React.useEffect(() => {
    if (!placeId || window.__robloxThumbCache[placeId]) return;
    let cancelled = false;
    // Use roproxy.com as a CORS-friendly proxy for Roblox APIs
    fetch(`https://apis.roproxy.com/universes/v1/places/${placeId}/universe`)
      .then(r => r.json())
      .then(j => {
        const uid = j?.universeId;
        if (!uid) throw new Error("no universe");
        return fetch(`https://thumbnails.roproxy.com/v1/games/icons?universeIds=${uid}&size=420x420&format=Png&isCircular=false`);
      })
      .then(r => r.json())
      .then(j => {
        const img = j?.data?.[0]?.imageUrl;
        if (img && !cancelled) {
          window.__robloxThumbCache[placeId] = img;
          setUrl(img);
        }
      })
      .catch(() => {});
    return () => { cancelled = true; };
  }, [placeId]);
  return url;
}

function GameThumb({ id, name, className, fallbackSize = "13px" }) {
  const url = useRobloxThumb(id);
  return (
    <div className={className || "w-full aspect-square rounded-lg overflow-hidden relative"} style={{ background: "rgba(255,255,255,0.04)", border: "1px solid rgba(255,255,255,0.06)" }}>
      <div className="absolute inset-0 flex items-center justify-center font-bold" style={{ color: "rgba(255,255,255,0.3)", fontFamily: "var(--font-mono)", fontSize: fallbackSize }}>{name.slice(0,2).toUpperCase()}</div>
      {url && <img src={url} alt={name} className="absolute inset-0 w-full h-full object-cover" referrerPolicy="no-referrer"/>}
    </div>
  );
}

Object.assign(window, { useRobloxThumb, GameThumb });
