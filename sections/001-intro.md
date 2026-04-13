% Building a Smart Home Board Lab
% <img src="img/headshot.png" alt="Drew Moseley"><span><small>Presented by</small><strong>Drew Moseley</strong>Torizon Professional Services, Staff Developer<br>Toradex</span>
% TBD Conference – TBD Date

---

## WITH YOU TODAY… {.speaker-slide}

<div class="speaker-cards">
<div class="speaker-card">
<img src="img/headshot.png" alt="Drew Moseley">
<p class="speaker-name">Drew Moseley</p>
<p class="speaker-role">Torizon Professional Services, Staff Developer</p>
<p class="speaker-company">Toradex</p>
<div class="speaker-contact">
<a href="mailto:drew.moseley@toradex.com" class="contact-link"><img src="img/email.svg" alt="Email" class="contact-sicon"> drew.moseley@toradex.com</a>
<a href="https://www.linkedin.com/in/drewmoseley/" class="contact-link"><img src="img/linkedin.svg" alt="LinkedIn" class="contact-sicon"> /in/drewmoseley</a>
<a href="https://x.com/drewmoseley" class="contact-link"><img src="img/x.svg" alt="X" class="contact-sicon"> @drewmoseley</a>
<a href="https://github.com/drewmoseley" class="contact-link"><img src="img/github.svg" alt="GitHub" class="contact-sicon"> drewmoseley</a>
<a href="https://fosstodon.org/@drewmoseley" class="contact-link"><img src="img/mastodon.svg" alt="Mastodon" class="contact-sicon"> &#64;drewmoseley&#64;fosstodon.org</a>
</div>
</div>
</div>

---

## Your Dev Environment Shouldn't End at Your Desk

The requirements for a real board lab boil down to four things:<sup>1</sup>

- **Out-of-band console** — a connection that survives broken networking, kernels, bootloaders
- **Remote power control** — power cycle and control boot mode without being there
- **Scripted reimaging** — automated, repeatable provisioning from a known baseline
- **Logging and inspection** — shift from interactive debugging to artifact review

This talk is the how-to. Let's build it.

<p class="slide-footnote"><sup>1</sup> embeddedrelated.com/showarticle/1782.php</p>

---

## What We'll Cover

- **Serial console access** — UART, ser2net, udev stable names
- Integrating boards with **Home Assistant** for monitoring and automation
- **Tasmota** smart switches for remote power cycling and automated testing
- **HVAC / environmental** monitoring for temperature-sensitive hardware
- **Proxmox** virtualization alongside home automation
- Practical automations that improve your dev workflow
- Cost-effective alternatives to expensive lab equipment

::: notes
Set expectations: this is a production setup I actually run, not a demo project.
The blog post covers the "why" — this talk is the "how."
:::
