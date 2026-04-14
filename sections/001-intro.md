% Building a Smart Home Board Lab
% <img src="img/headshot.png" alt="Drew Moseley" class="headshot"><span><small>Presented by</small><strong>Drew Moseley</strong>Torizon Professional Services, Staff Developer — Toradex<br><small><img src="img/email.svg" class="contact-icon"> drew.moseley@toradex.com <img src="img/linkedin.svg" class="contact-icon"> /in/drewmoseley <img src="img/github.svg" class="contact-icon"> drewmoseley <img src="img/mastodon.svg" class="contact-icon"> @drewmoseley@fosstodon.org <img src="img/x.svg" class="contact-icon"> @drewmoseley</small></span>
% Embedded Online Conference – May 11–15, 2026

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
