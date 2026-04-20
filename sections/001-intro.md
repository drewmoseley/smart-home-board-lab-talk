% Building a Smart Home Board Lab
% <img src="img/headshot.png" alt="Drew Moseley" class="headshot"><span><small>Presented by</small><strong>Drew Moseley</strong>Torizon Professional Services, Staff Developer — Toradex<br><small><img src="img/email.svg" class="contact-icon"> drew.moseley@toradex.com <img src="img/linkedin.svg" class="contact-icon"> /in/drewmoseley <img src="img/github.svg" class="contact-icon"> drewmoseley <img src="img/mastodon.svg" class="contact-icon"> @drewmoseley@fosstodon.org <img src="img/x.svg" class="contact-icon"> @drewmoseley</small></span>
% Embedded Online Conference – May 11–15, 2026

---

## Your Dev Environment Shouldn't End at Your Desk

```{=html}
<p class="hook-banner">It's 11pm. Your board is hung, SSH is dead, and you're not in the office. The right infrastructure makes that a 30-second fix — on a hobbyist budget.</p>
<div class="req-grid">
  <div class="req-card">
    <span class="req-num">01</span>
    <strong>Out-of-Band Console</strong>
    <p>Survives broken networking, kernels, and bootloaders</p>
  </div>
  <div class="req-card">
    <span class="req-num">02</span>
    <strong>Remote Power Control</strong>
    <p>Cycle power and control boot mode without being there</p>
  </div>
  <div class="req-card">
    <span class="req-num">03</span>
    <strong>Scripted Reimaging</strong>
    <p>Automated, repeatable provisioning from a known baseline</p>
  </div>
  <div class="req-card">
    <span class="req-num">04</span>
    <strong>Logging &amp; Inspection</strong>
    <p>Shift from interactive debugging to artifact review</p>
  </div>
</div>
<p class="slide-tagline">This talk is the how-to. Let's build it.</p>
<p class="slide-footnote"><sup>1</sup> embeddedrelated.com/showarticle/1782.php</p>
```

::: notes
Open with the 11pm scenario to set the stakes, then pivot to the four
requirements this talk addresses. This is a production setup I actually run,
not a demo project. The blog post covers the "why" — this talk is the "how."
:::
