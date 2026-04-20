// Showcase, Supported Games, Legacy, Support pages

function ShowcasePage() {
  const h = window.TWEAKS.accentHue;
  const [playing, setPlaying] = useState(false);
  const vidId = "PYe13INIE2Q";
  return (
    <div className="relative w-full min-h-screen pt-20 pb-32 px-6" data-screen-label="03 Showcase">
      <Aurora hue={h} />
      <div className="relative z-10 max-w-5xl mx-auto">
        <div className="text-center mb-14">
          <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full text-[11px] font-semibold tracking-[0.16em] uppercase mb-6" style={{ background: "rgba(255,255,255,0.03)", border: "1px solid rgba(255,255,255,0.08)", color: "var(--fg-dim)", fontFamily: "var(--font-mono)" }}>Gallery</div>
          <h1 className="text-[clamp(3rem,8vw,6rem)] leading-[0.95] tracking-[-0.03em]" style={{ fontFamily: "var(--font-display)" }}>
            <span style={{ color: "var(--fg)" }}>See it in</span> <span style={{ fontStyle: "italic", color: "var(--fg)" }}>action.</span>
          </h1>
          <p className="mt-6 max-w-xl mx-auto text-[16px]" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-body)" }}>A quick walkthrough of Universal Hub in action.</p>
        </div>

        <div className="relative rounded-[28px] overflow-hidden" style={{ background: "linear-gradient(180deg, rgba(20,20,22,0.9), rgba(14,14,16,0.9))", border: "1px solid rgba(255,255,255,0.06)", boxShadow: "0 40px 100px -20px rgba(0,0,0,0.7)" }}>
          <div className="aspect-video relative" style={{ background: "#000" }}>
            {playing ? (
              <iframe className="absolute inset-0 w-full h-full" src={`https://www.youtube-nocookie.com/embed/${vidId}?autoplay=1&rel=0&playsinline=1`} title="Universal Hub showcase" frameBorder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowFullScreen referrerPolicy="strict-origin-when-cross-origin" />
            ) : (
              <>
                <img src={`https://i.ytimg.com/vi/${vidId}/maxresdefault.jpg`} alt="Universal Hub showcase thumbnail" className="absolute inset-0 w-full h-full object-cover opacity-80" />
                <div className="absolute inset-0 flex items-center justify-center" style={{ background: "linear-gradient(180deg, transparent, rgba(0,0,0,0.3))" }}>
                  <button onClick={() => setPlaying(true)} className="w-20 h-20 rounded-full flex items-center justify-center cursor-pointer" style={{ background: "var(--fg)", color: "oklch(16% 0 0)", boxShadow: "0 20px 50px rgba(0,0,0,0.6)", transition: "transform 0.2s ease" }} onMouseEnter={e => e.currentTarget.style.transform = "scale(1.05)"} onMouseLeave={e => e.currentTarget.style.transform = "scale(1)"}>
                    <Icon.Play width="28" height="28" style={{ marginLeft: 4 }}/>
                  </button>
                </div>
              </>
            )}
          </div>
          <div className="px-6 py-5 flex items-center justify-between" style={{ borderTop: "1px solid rgba(255,255,255,0.05)" }}>
            <div>
              <div className="text-[15px] font-medium tracking-tight" style={{ fontFamily: "var(--font-body)" }}>Universal Hub Script</div>
              <div className="text-[12px] mt-0.5" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-mono)" }}>Angxers</div>
            </div>
            <a href={`https://youtu.be/${vidId}`} target="_blank" rel="noopener noreferrer">
              <Pill variant="glass" size="md" icon={<Icon.Youtube width="14" height="14" style={{ color: "#ff3b3b" }}/>} iconRight={<Icon.External width="12" height="12"/>}>Watch on YouTube</Pill>
            </a>
          </div>
        </div>
      </div>
    </div>
  );
}

function GamesPage() {
  const h = window.TWEAKS.accentHue;
  const [filter, setFilter] = useState("all");
  const games = [
    { n: "Prison Life", s: "Supported", cat: "Roleplay", id: 155615604 },
    { n: "Murder Mystery 2", s: "Supported", cat: "Round-based", id: 142823291 },
    { n: "Da Hood", s: "Supported", cat: "Roleplay", id: 2788229376 },
    { n: "Mic Up", s: "Supported", cat: "Social", id: 6884319169 },
    { n: "Natural Disaster Survival", s: "Supported", cat: "Survival", id: 189707 },
  ];
  const supported = games.filter(g => g.s === "Supported").length;
  const filtered = filter === "all" ? games : games.filter(g => g.s.toLowerCase().includes(filter));

  const statusPill = (s) => {
    const isLive = s === "Supported";
    const hue = isLive ? 150 : 70;
    return (
      <span className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-[11px] font-semibold" style={{ background: accentSoft(hue), color: accent(hue, 78), border: `1px solid ${accentBorder(hue)}`, fontFamily: "var(--font-mono)" }}>
        <span className="w-1 h-1 rounded-full" style={{ background: accent(hue, 72), boxShadow: `0 0 6px ${accent(hue, 72)}` }}/>
        {s}
      </span>
    );
  };

  return (
    <div className="relative w-full min-h-screen pt-20 pb-32 px-6" data-screen-label="04 Supported Games">
      <Aurora hue={h} intensity={0.6}/>
      <div className="relative z-10 max-w-5xl mx-auto">
        <div className="text-center mb-12">
          <h1 className="text-[clamp(3rem,8vw,6rem)] leading-[0.95] tracking-[-0.03em]" style={{ fontFamily: "var(--font-display)" }}>
            <span style={{ color: "var(--fg)" }}>Supported</span> <span style={{ fontStyle: "italic", color: accent(h, 72) }}>games.</span>
          </h1>
          <p className="mt-6 max-w-xl mx-auto text-[16px]" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-body)" }}>
            Works in every Roblox game. These 5 have dedicated feature sets with extra tooling.
          </p>
        </div>

        <div className="flex items-center gap-2 mb-5">
          <div className="text-[11px] ml-auto" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-mono)" }}>{games.length} games</div>
        </div>

        <div className="rounded-[20px] overflow-hidden" style={{ background: "linear-gradient(180deg, rgba(18,18,20,0.9), rgba(12,12,14,0.9))", border: "1px solid rgba(255,255,255,0.06)" }}>
          <div className="grid grid-cols-12 px-5 py-3 text-[10.5px] tracking-[0.18em] uppercase" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-mono)", borderBottom: "1px solid rgba(255,255,255,0.05)" }}>
            <div className="col-span-6">Game</div>
            <div className="col-span-3">Category</div>
            <div className="col-span-2">Status</div>
            <div className="col-span-1 text-right">Link</div>
          </div>
          {filtered.map((g, i) => (
            <div key={g.n} className="grid grid-cols-12 items-center px-5 py-3.5 group transition-colors hover:bg-white/[0.02]" style={{ borderBottom: i === filtered.length-1 ? "none" : "1px solid rgba(255,255,255,0.04)" }}>
              <div className="col-span-6 flex items-center gap-3">
                <GameThumb id={g.id} name={g.n} className="w-9 h-9 rounded-lg overflow-hidden relative" fallbackSize="10px"/>
                <div className="text-[14px] font-medium" style={{ fontFamily: "var(--font-body)" }}>{g.n}</div>
              </div>
              <div className="col-span-3 text-[12px]" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-mono)" }}>{g.cat}</div>
              <div className="col-span-2">{statusPill(g.s)}</div>
              <div className="col-span-1 text-right opacity-40 group-hover:opacity-100 transition">
                <button className="w-7 h-7 rounded-md inline-flex items-center justify-center" style={{ border: "1px solid rgba(255,255,255,0.06)" }}><Icon.External width="12" height="12"/></button>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

function LegacyPage() {
  const h = window.TWEAKS.accentHue;
  const versions = ["1.9","1.8","1.7.1","1.7","1.6","1.5","1.4","1.3","1.2"];
  return (
    <div className="relative w-full min-h-screen pt-20 pb-32 px-6" data-screen-label="05 Legacy Versions">
      <Aurora hue={h} intensity={0.5}/>
      <div className="relative z-10 max-w-6xl mx-auto">
        <div className="text-center mb-14">
          <h1 className="text-[clamp(3rem,8vw,6rem)] leading-[0.95] tracking-[-0.03em]" style={{ fontFamily: "var(--font-display)" }}>
            <span style={{ color: "var(--fg)" }}>Legacy</span> <span style={{ fontStyle: "italic", color: accent(h, 72) }}>versions.</span>
          </h1>
          <p className="mt-6 max-w-xl mx-auto text-[16px]" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-body)" }}>
            Every historical build, archived and loadable. Pin a version if a specific one works best for your game.
          </p>
        </div>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
          {versions.map((v, i) => {
            const isLatest = i === 0;
            return (
              <LegacyCard key={v} version={v} latest={isLatest} hue={h} script={`https://raw.githubusercontent.com/Angxers2/Unihub/Legacy-Versions/refs/heads/main/Unihub%20${v}.lua`}/>
            );
          })}
        </div>
      </div>
    </div>
  );
}

function LegacyCard({ version, latest, hue, script }) {
  const [copied, setCopied] = useState(false);
  const copy = () => {
    navigator.clipboard?.writeText(`loadstring(game:HttpGet("${script}"))()`);
    setCopied(true);
    setTimeout(() => setCopied(false), 1500);
  };
  return (
    <div className="relative rounded-2xl p-5" style={{ background: "linear-gradient(180deg, rgba(20,20,22,0.9), rgba(14,14,16,0.9))", border: "1px solid rgba(255,255,255,0.06)" }}>
      <div className="flex items-center justify-between mb-4">
        <div className="text-[22px] tracking-tight" style={{ fontFamily: "var(--font-display)", color: accent(hue, 75) }}>v{version}</div>
        {latest && <span className="px-2 py-0.5 rounded-full text-[10px] font-semibold tracking-wider uppercase" style={{ background: accentSoft(150), color: accent(150, 78), border: `1px solid ${accentBorder(150)}`, fontFamily: "var(--font-mono)" }}>Latest Legacy</span>}
      </div>
      <pre className="text-[11px] leading-[1.6] rounded-lg p-3 overflow-hidden break-all whitespace-pre-wrap mb-4" style={{ fontFamily: "var(--font-mono)", background: "rgba(0,0,0,0.3)", color: "var(--fg-dim)", border: "1px solid rgba(255,255,255,0.04)", maxHeight: 90 }}>
        loadstring(game:HttpGet("…Unihub%20{version}.lua"))()
      </pre>
      <Pill variant="solid" hue={hue} size="sm" onClick={copy} icon={copied ? <Icon.Check width="12" height="12"/> : <Icon.Copy width="12" height="12"/>}>
        {copied ? "Copied" : "Copy Script"}
      </Pill>
    </div>
  );
}

function SupportPage() {
  const h = window.TWEAKS.accentHue;
  const [form, setForm] = useState({ name: "", email: "", message: "" });
  const [sent, setSent] = useState(false);
  const send = (e) => {
    e.preventDefault();
    setSent(true);
    setTimeout(() => { setSent(false); setForm({ name: "", email: "", message: "" }); }, 2400);
  };
  const field = (k, label, type="text", Tag="input", rows) => (
    <div>
      <label className="text-[10.5px] tracking-[0.18em] uppercase block mb-2" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-mono)" }}>{label}</label>
      <Tag type={type} rows={rows} value={form[k]} onChange={(e)=>setForm({...form,[k]:e.target.value})} className="w-full px-4 py-3 rounded-xl text-[14px] outline-none resize-none" style={{ background: "rgba(255,255,255,0.02)", border: "1px solid rgba(255,255,255,0.06)", color: "var(--fg)", fontFamily: "var(--font-body)" }}/>
    </div>
  );
  return (
    <div className="relative w-full min-h-screen pt-20 pb-32 px-6" data-screen-label="06 Support">
      <Aurora hue={h}/>
      <div className="relative z-10 max-w-5xl mx-auto">
        <div className="text-center mb-14">
          <h1 className="text-[clamp(3rem,8vw,6rem)] leading-[0.95] tracking-[-0.03em]" style={{ fontFamily: "var(--font-display)" }}>
            <span style={{ color: "var(--fg)" }}>Need a</span> <span style={{ fontStyle: "italic", color: accent(h, 72) }}>hand?</span>
          </h1>
          <p className="mt-6 max-w-xl mx-auto text-[16px]" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-body)" }}>Join the community on Discord, or drop us a note directly. We read everything.</p>
        </div>
        <div className="grid grid-cols-1 md:grid-cols-5 gap-5">
          <div className="md:col-span-2 rounded-[20px] p-8 flex flex-col" style={{ background: "linear-gradient(180deg, rgba(20,20,22,0.9), rgba(14,14,16,0.9))", border: "1px solid rgba(255,255,255,0.06)" }}>
            <div className="w-12 h-12 rounded-xl flex items-center justify-center mb-5" style={{ background: "linear-gradient(135deg, oklch(60% 0.2 265), oklch(45% 0.22 275))", color: "#fff" }}>
              <Icon.Discord width="22" height="22"/>
            </div>
            <div className="text-[22px] tracking-tight mb-1" style={{ fontFamily: "var(--font-display)" }}>Discord</div>
            <p className="text-[14px] mb-6" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-body)" }}>
              Bug reports, feature requests, showcases, and live help from the community.
            </p>
            <div className="mt-auto">
              <a href="https://discord.gg/ZNfKFyuUEd" target="_blank" rel="noopener noreferrer">
                <Pill variant="solid" size="md" icon={<Icon.Discord width="14" height="14"/>} iconRight={<Icon.Arrow width="12" height="12"/>}>
                  Join Server
                </Pill>
              </a>
              <div className="flex items-center gap-4 mt-5 text-[11px]" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-mono)" }}>
                <span>discord.gg/ZNfKFyuUEd</span>
              </div>
            </div>
          </div>
          <div className="md:col-span-3 rounded-[20px] p-8" style={{ background: "linear-gradient(180deg, rgba(20,20,22,0.9), rgba(14,14,16,0.9))", border: "1px solid rgba(255,255,255,0.06)" }}>
            <div className="text-[22px] tracking-tight mb-6" style={{ fontFamily: "var(--font-display)" }}>Send feedback</div>
            <form onSubmit={send} className="flex flex-col gap-4">
              <div className="grid grid-cols-2 gap-4">
                {field("name", "Name")}
                {field("email", "Email", "email")}
              </div>
              {field("message", "Message", "text", "textarea", 5)}
              <div className="flex items-center justify-between pt-2">
                <div className="text-[11px]" style={{ color: "var(--fg-dim)", fontFamily: "var(--font-mono)" }}>Typically replies in &lt; 24h</div>
                <Pill variant="solid" hue={h} size="md" as="button" type="submit" icon={sent ? <Icon.Check width="14" height="14"/> : <Icon.Send width="13" height="13"/>}>
                  {sent ? "Sent!" : "Send message"}
                </Pill>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
}

Object.assign(window, { ShowcasePage, GamesPage, LegacyPage, SupportPage });
