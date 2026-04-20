---
name: Talk production status
description: Current state of the smart-home-board-lab-talk as of April 2026
type: project
---

Talk is in active production as of 2026-04-20.

**Why:** Pre-recorded 15-minute lightning talk for Embedded Online Conference
2026 (May 11–15). First recording done; script corrected and committed.

**How to apply:** When resuming, the talk is essentially content-complete.
Focus areas: recording quality, slide polish, any last content gaps.

## Current state

- 17 slides + title slide (~13:30 estimated)
- script.txt in repo root — corrected recording script, 80-char wrapped
- First recording done via Descript; script cleaned up and committed
- All content uses first person (I/my) — enforced

## Slide deck summary

001 Your Dev Environment (11pm hook + 4 req cards)
002 What I'm Optimizing For (goal tiles + scope note)
003 Self-Contained Board Units (hardware photos)
004 System Architecture (SVG diagram)
005 Board Farm Controller (RPi5 + udev)
006 Serial Console Access (udev rules + serial-term)
007 Display Access (HDMI switch + PiKVM SVG)
008 Power Control with Tasmota (relay board + ha-switch.sh code)
009 Why Home Assistant + Dashboard screenshot
010 My Lab Machines (2×2 logo grid)
011 Simple Shell Glue (flash-board script + steps)
012 Cost-Effective Alternatives (comparison table)
013 Tips for Getting Started (horizontal timeline)
014 Beyond the Core Setup (3×3 chip grid)
015 Back to 11 PM (4-step closing callback)
016 What's Next (Lab Rax, LabGrid, USB SD Mux)
017 Thank You

## Key technical decisions made

- Solarized Dark syntax highlighting (custom .theme file in infra repo)
- infra/ is a symlink to ../reveal-talk-infra — commit changes there separately
- CSS in talk-extras.css (loaded after infra/custom.css)
- All first-person language (no "we/let's/our")
