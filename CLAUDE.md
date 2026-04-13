# smart-home-board-lab-talk — Claude guidance

@infra/CLAUDE.md

Talk: **Building a Smart Home Board Lab**
Author: Drew Moseley (Toradex)
Venue: TBD

See `infra/CLAUDE.md` for the full slide authoring system reference (format,
build commands, manage_slides.py, base CSS classes).

---

## Talk abstract

Your development environment shouldn't end at your workstation. This talk covers
building an intelligent home lab that monitors boards, automates workflows, and
turns everyday smart devices into development tools — on a hobbyist budget.

Topics: Home Assistant integration, Tasmota power control, environmental monitoring,
Proxmox virtualization, automated test pipelines, cost-effective alternatives to
lab equipment.

Audience: Embedded developers, home lab enthusiasts, anyone tired of manually
power cycling boards.

---

## Talk-specific structure

```text
sections/
  001-intro.md                title + speaker bio + requirements framing (refs blog post) + agenda
  002-serial-console-access.md UART hardware, ser2net, udev stable names, HA integration
  003-home-assistant.md       Home Assistant integration for board monitoring
  004-tasmota.md              Tasmota smart switches — remote power cycling
  005-environment.md          HVAC/environmental monitoring
  006-proxmox.md              Proxmox virtualization alongside home automation
  007-automations.md          Practical automations (watchdog, test sequencer, presence)
  008-cost-effective.md       Cost-effective alternatives + hardware BOM
  009-wrap-up.md              Before/after summary
  010-thank-you.md            Thank-you slide
  011-backup.md               Backup slides (MQTT primer, Tasmota flashing, HA discovery)

img/
  headshot.png          speaker photo (symlink or copy from containers-embedded-talk)
  toradex-logo.png      Toradex logo
  (contact icons: email.svg, linkedin.svg, x.svg, github.svg, mastodon.svg)
```

---

## Companion blog post

"Embedded Linux Board Farms 101: The Requirements That Actually Matter"
Published: April 2, 2026 — https://www.embeddedrelated.com/showarticle/1782.php

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

## Notes

- Images in `img/` need to be populated (symlink or copy from containers-embedded-talk
  for shared assets like headshot, toradex-logo, and contact icons).
- Venue/date in `sections/001-intro.md` metadata line is a placeholder — update
  when confirmed.
- `TITLE_LOGOS` in Makefile currently only includes `img/toradex-logo.png`;
  add a conference logo when the venue is confirmed.
