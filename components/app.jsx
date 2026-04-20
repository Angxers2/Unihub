// App shell
const { useState: useStateA, useEffect: useEffectA } = React;

function App() {
  const [page, setPage] = useState(() => localStorage.getItem("unihub-page") || "home");
  const [tweaks, setTweaks] = useState(window.TWEAKS);
  const [tweaksOpen, setTweaksOpen] = useState(false);
  const [editMode, setEditMode] = useState(false);

  useEffect(() => {
    localStorage.setItem("unihub-page", page);
    const el = document.getElementById("scroll-root");
    el?.scrollTo({ top: 0, behavior: "auto" });
  }, [page]);

  // Apply tweaks to CSS variables + window.TWEAKS
  useEffect(() => {
    window.TWEAKS = tweaks;
    const root = document.documentElement;
    root.style.setProperty("--font-display", `'${tweaks.displayFont}', serif`);
    root.style.setProperty("--font-body", `'${tweaks.bodyFont}', system-ui, sans-serif`);
    root.style.setProperty("--accent-h", tweaks.accentHue);
    document.getElementById("grain-layer").style.opacity = tweaks.grain ? 1 : 0;
  }, [tweaks]);

  // Edit mode disabled — no Tweaks toggle shown

  const updateTweak = (k, v) => {
    const next = { ...tweaks, [k]: v };
    setTweaks(next);
    window.parent.postMessage({ type: "__edit_mode_set_keys", edits: { [k]: v } }, "*");
  };

  const pages = { home: HomePage, lite: LitePage, showcase: ShowcasePage, games: GamesPage, legacy: LegacyPage, support: SupportPage, changelog: ChangelogPage };
  const CurrentPage = pages[page] || HomePage;

  return (
    <div className="min-h-screen w-full" style={{ background: "var(--bg)", color: "var(--fg)" }}>
      <Nav page={page} setPage={setPage} />
      <CurrentPage key={page} setPage={setPage} />
      <Footer onNavigate={setPage} />

    </div>
  );
}

ReactDOM.createRoot(document.getElementById("root")).render(<App/>);
