## What This Replaces (and What It Costs)

| Lab Capability | Enterprise Tool | Home Lab Alternative | Approx. Cost |
|---|---|---|---|
| Remote power control | PDU (~$500+) | Tasmota smart plug | $12 |
| Board monitoring | Custom agent + dashboard | Home Assistant + MQTT | Free (self-hosted) |
| Environmental sensing | Data logger | Zigbee temp sensor | $8 |
| Build farm | Dedicated rack server | Proxmox on mini-PC | $200–$400 |
| CI runner | Hosted runners | Self-hosted LXC | Free |

---

## Hardware I Actually Use

:::: {.slide-columns}
::: {.slide-col-left}
**Compute:**

- Beelink SER5 (AMD Ryzen 5, 32 GB RAM) — Proxmox host
- Raspberry Pi 4 — fallback / test target
- Toradex Verdin iMX8M Plus — primary dev target

**Power control:**

- Sonoff S31 (flashed Tasmota) — per-board outlets
- Kasa KP303 strip — multi-board setups
:::
::: {.slide-col-right}
**Networking / sensors:**

- Zigbee2MQTT + ConBee II USB stick
- IKEA VINDRIKTNING air quality sensor
- Aqara temp/humidity sensors

**Total lab cost: ~$400**\
vs. commercial equivalent: $3,000–$10,000+
:::
::::

---

## Tips for Getting Started

- Start with Home Assistant on a spare Pi or as a Proxmox VM
- Add one Tasmota outlet for one board — feel the workflow
- MQTT is the glue: learn it early, everything integrates
- Don't over-automate at first — add automations when you feel pain
- Community resources: HACS, r/homeassistant, ESPHome forums
