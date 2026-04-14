## What We're Optimizing For

- **Low cost** — maker/hobbyist hardware: Raspberry Pi, cheap smart plugs, USB adapters
- **Minimum physical space** — fits on a shelf, not a server rack
- **Remote access** — fully operable when you're not at home
- **Expandable** — add boards, sensors, and automations incrementally

### Scope: SBCs running Linux

This setup is designed for **single-board computers running Linux** (Toradex, Raspberry Pi, BeagleBone, etc.).
MCU-based boards have different constraints — some of this applies, but your mileage may vary.

::: notes
Frame the design philosophy before diving into tools. This isn't enterprise
lab infrastructure — it's the minimum viable setup that gives you real leverage
as an embedded developer.

Explicitly call out the SBC/Linux focus early so MCU folks know to mentally
flag what applies to them. Power cycling and serial console are broadly
applicable; the software stack less so.
:::
