## My Lab Machines

```{=html}
<div class="machine-grid">
  <div class="machine-card">
    <img src="img/ubuntu-logo-orange.svg" alt="Ubuntu">
    <div class="machine-name">NUC-style PC</div>
    <div class="machine-role">Always-on Docker host — runs Home Assistant and supporting services</div>
  </div>
  <div class="machine-card">
    <img src="img/fedora-logo.png" alt="Fedora / ucore-hci">
    <div class="machine-name">Threadripper (ucore-hci)</div>
    <div class="machine-role">Heavy lifting — Yocto builds, CI runners, fast <code>bitbake</code> parallelism</div>
  </div>
  <div class="machine-card">
    <img src="img/rpi-logo.png" alt="Raspberry Pi">
    <div class="machine-name">Raspberry Pi 5</div>
    <div class="machine-role">Board farm controller — USB serial adapters, power control coordination</div>
  </div>
  <div class="machine-card">
    <img src="img/pikvm-logo.svg" alt="PiKVM">
    <div class="machine-name">PiKVM</div>
    <div class="machine-role">Dedicated KVM-over-IP — remote display via HDMI switch + splitter</div>
  </div>
</div>
<p class="machine-caveat">Your setup will almost certainly look different — the key is separating <strong>always-on services</strong> from <strong>compute</strong> from <strong>physical board interfacing</strong>.</p>
```

::: notes
Don't dwell on the specific hardware choices — the point is the separation of
concerns, not the exact machines. ucore-hci may need a brief explanation
(immutable Fedora CoreOS variant) if the audience isn't familiar.
:::
