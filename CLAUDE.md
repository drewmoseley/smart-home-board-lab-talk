# smart-home-board-lab-talk — Claude guidance

@infra/CLAUDE.md

Talk: **Building a Smart Home Board Lab**
Author: Drew Moseley (Toradex)
Venue: Embedded Online Conference 2026 — May 11–15, 2026

See `infra/CLAUDE.md` for the full slide authoring system reference (format,
build commands, manage_slides.py, base CSS classes).

---

## Talk abstract

Your development environment shouldn't end at your workstation. This talk covers
building an intelligent home lab that monitors boards, automates workflows, and
turns everyday smart devices into development tools — on a hobbyist budget.

Topics: Home Assistant integration, Tasmota power control, serial console access,
cost-effective alternatives to lab equipment, next steps (LabGrid, SD Mux, rack).

Audience: Embedded developers, home lab enthusiasts, anyone tired of manually
power cycling boards.

Format: 15-minute pre-recorded lightning talk (~13:30 estimated).

---

## Talk-specific structure

```text
sections/
  001-intro.md                 Title + 11pm hook banner + 4 req cards + blog ref
  002-goals.md                 "What I'm Optimizing For" — 4 goal tiles + scope note
  003-board-units.md           "Self-Contained Board Units" — photos of hw design
  004-system-architecture.md   SVG diagram: HA hub → Tasmota/Pi5/PiKVM → boards
  005-board-farm-controller.md Raspberry Pi 5 as physical hub, udev, mini PC option
  006-serial-console.md        UART, USB-UART adapters, udev rules, serial-term script
  007-display-access.md        HDMI switch + PiKVM setup, SVG diagram
  008-tasmota.md               ESP8266 relay board, MQTT, recovery GPIO, ha-switch.sh
  009-home-assistant.md        Why HA + docker-compose snippet + dashboard screenshot
  010-lab-machines.md          2×2 logo card grid: NUC, Threadripper, Pi5, PiKVM
  011-shell-glue.md            flash-board script + 4 numbered step cards (2-col)
  012-cost-effective.md        6-row comparison table vs enterprise alternatives
  013-getting-started.md       5-step horizontal timeline
  014-beyond-core.md           3×3 chip grid of extended capabilities
  015-in-practice.md           "Back to 11 PM" — 4-step scenario callback
  016-next-steps.md            3 cards: Lab Rax rack, LabGrid, Pengutronix USB SD Mux
  017-thank-you.md             Thank-you + Toradex URLs

img/
  headshot.png              speaker photo
  toradex-logo.png          Toradex logo
  eoc-logo.png              Embedded Online Conference logo (TITLE_LOGOS)
  relay_board.jpg           ESP12F relay board photo
  tasmota-switch-cropped.png Tasmota web UI screenshot
  homeassistant.png         HA dashboard screenshot
  board-farm-top.png        Board farm unit top view
  board-farm-guts.png       Board farm unit wiring view
  rpi5.png                  Raspberry Pi 5 board photo
  ubuntu-logo-orange.svg    Ubuntu logo (orange)
  fedora-logo.png           Fedora logo
  rpi-logo.png              Raspberry Pi logo
  pikvm-logo.svg            PiKVM logo
  labgrid-logo.png          LabGrid project logo
  makerworld-logo.svg       MakerWorld logo
  pengutronix-logo.svg      Pengutronix logo
  usbsdmux.jpg              Pengutronix USB SD Mux product photo
  labrax.png                Lab Rax 3D-printed rack photo
  main-slide-background.png  Main slide bg (required by infra/custom.css)
  title-slide-background.png Title slide bg (required by infra/custom.css)
  (contact icons: email.svg, linkedin.svg, x.svg, github.svg, mastodon.svg)

script.txt                  Recording script (corrected, 80-char wrapped)
talk-extras.css             Talk-specific CSS overrides
Makefile                    Build config (HTML_OUT, PDF_OUT, TITLE_LOGOS, etc.)
```

---

## Companion blog post

"Embedded Linux Board Farms 101: The Requirements That Actually Matter"
Published: April 2, 2026 — <https://www.embeddedrelated.com/showarticle/1782.php>

This post is a teaser/prerequisite for the talk. Key points it establishes:

- **Serial console (UART)** is essential out-of-band access — survives bootloader,
  kernel, and networking changes where SSH would be cut off
- **Remote power control** — power cycle and control boot modes without physical presence
- **Scripted reimaging** — automated provisioning for consistent baseline state
- **Logging & inspection** — remote debugging shifts to log analysis, not interactive
- The hobbyist approach (Raspberry Pi, USB serial adapters, smart plugs, open-source
  tools) is validated as legitimate dev infrastructure; the talk builds on this
- Home Assistant + Tasmota are mentioned as the "smart home integration" layer

The talk goes deeper on the HA/Tasmota/automation angle that the post introduces briefly.

---

## CSS classes added in talk-extras.css

| Class(es) | Slide | Purpose |
|-----------|-------|---------|
| `.hook-banner` | 001 | Green-bordered callout for 11pm scenario |
| `.req-grid`, `.req-card`, `.req-num` | 001 | 2×2 requirement cards |
| `.goal-grid`, `.goal-card`, `.goal-label`, `.goal-desc` | 002 | 4-across goal tiles |
| `.scope-note` | 002 | Highlighted scope callout |
| `.slide-tagline` | 001 | Tagline text below grid |
| `.machine-grid`, `.machine-card`, `.machine-name`, `.machine-role` | 010 | 2×2 logo cards |
| `.shell-glue-columns`, `.shell-glue-codewindow`, `.shell-glue-steps` | 011 | 2-col shell glue layout |
| `.shell-step`, `.shell-step-num` | 011 | Numbered step cards |
| `.tips-timeline`, `.tips-track`, `.tips-items`, `.tips-item`, `.tips-node` | 013 | Horizontal timeline |
| `.beyond-chips`, `.beyond-chip` | 014 | 3×3 chip/badge grid |
| `.practice-steps`, `.practice-step`, `.practice-num`, `.practice-body`, `.practice-tool` | 015 | 4-step scenario layout |
| `.next-grid`, `.next-card`, `.next-logo-area`, `.next-logo`, `.next-title`, `.next-desc`, `.next-link` | 016 | 3-card next steps layout |
| `.bfc-hero-img` | 005 | RPi5 image sizing |
| Solarized Dark CSS variable overrides | all code | Dark code block theme |
| numberLines fixes | 011 | Line numbers inside dark box |

---

## infra changes (commit to reveal-talk-infra repo separately)

- `infra/solarized-dark.theme` — Solarized Dark pandoc syntax theme (Kate/JSON)
- `infra/Makefile.include` — uses `--syntax-highlighting=$(HIGHLIGHT_STYLE)`

---

## Memory

Claude memory for this project lives in `.claude/memory/` within the repo (not in
`~/.claude/projects/`). This keeps it portable across machines via SyncThing.
Always read from and write memory to `.claude/memory/MEMORY.md` and
`.claude/memory/*.md`.

---

## Notes

- `infra/` is a symlink to `../reveal-talk-infra` — never `git add` files inside
  it from this repo; commit infra changes in the reveal-talk-infra repo directly.
- Venue confirmed: Embedded Online Conference 2026, May 11–15.
- `TITLE_LOGOS` in Makefile includes `img/toradex-logo.png` and `img/eoc-logo.png`.
- All slide content uses first person ("I", "my") — never "we" or "let's".
- `script.txt` in repo root is the corrected recording script (80-char line wrap).
- Estimated talk duration: ~13:30 across 17 slides + title.
