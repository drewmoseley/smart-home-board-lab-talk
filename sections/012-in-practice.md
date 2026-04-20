## Back to 11 PM

```{=html}
<p class="practice-intro">Your board is hung. Here's what the next 30 seconds look like.</p>

<div class="practice-steps">
  <div class="practice-step">
    <div class="practice-num">01</div>
    <div class="practice-body">
      <strong>HA dashboard shows the board is unresponsive</strong>
      <span>Entity state went stale — the watchdog automation already flagged it</span>
    </div>
    <div class="practice-tool">Home Assistant</div>
  </div>
  <div class="practice-step">
    <div class="practice-num">02</div>
    <div class="practice-body">
      <strong>Tap the power switch — relay cycles</strong>
      <span>One button in the dashboard, or one line in a script</span>
    </div>
    <div class="practice-tool">Tasmota</div>
  </div>
  <div class="practice-step">
    <div class="practice-num">03</div>
    <div class="practice-body">
      <strong>Watch the boot on the serial console</strong>
      <span>U-Boot, kernel, systemd — all visible without touching a cable</span>
    </div>
    <div class="practice-tool">Pi 5 + ser2net</div>
  </div>
  <div class="practice-step">
    <div class="practice-num">04</div>
    <div class="practice-body">
      <strong>Board is back — re-queue the CI job</strong>
      <span>Total time from alert to running: under a minute</span>
    </div>
    <div class="practice-tool">Back to sleep</div>
  </div>
</div>
<p class="practice-tagline">This is what a smart home board lab buys you: <strong>problems solved without presence.</strong></p>
```

::: notes
This is the payoff slide — bring it back to the opening scenario and show
exactly which pieces in the stack solved each part of the problem. The goal
is for attendees to leave with a clear mental model of how it all fits together.
:::

