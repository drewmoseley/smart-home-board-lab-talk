## What We're Optimizing For

```{=html}
<div class="goal-grid">
  <div class="goal-card">
    <div class="goal-label">Low Cost</div>
    <div class="goal-desc">Raspberry Pi, cheap smart plugs, USB serial adapters</div>
  </div>
  <div class="goal-card">
    <div class="goal-label">Minimum Space</div>
    <div class="goal-desc">Fits on a shelf, not a server rack</div>
  </div>
  <div class="goal-card">
    <div class="goal-label">Remote Access</div>
    <div class="goal-desc">Fully operable when you're not at home</div>
  </div>
  <div class="goal-card">
    <div class="goal-label">Expandable</div>
    <div class="goal-desc">Add boards, sensors, and automations incrementally</div>
  </div>
</div>
<div class="scope-note">
  <strong>Scope: SBCs running Linux</strong> — Toradex, Raspberry Pi, BeagleBone, etc.
  MCU boards have different constraints — some of this applies, but your mileage may vary.
</div>
```

::: notes
Frame the design philosophy before diving into tools. This isn't enterprise
lab infrastructure — it's the minimum viable setup that gives you real leverage
as an embedded developer.

Explicitly call out the SBC/Linux focus early so MCU folks know to mentally
flag what applies to them. Power cycling and serial console are broadly
applicable; the software stack less so.
:::
