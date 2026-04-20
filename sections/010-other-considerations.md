## Beyond the Core Setup

Depending on your needs, you might also care about:

- **Environmental monitoring** — temperature/humidity sensors for thermal testing or burn-in runs
- **Network isolation** — VLAN segmentation to keep boards off your main LAN
- **Physical security** — lab access logging, camera integration via HA
- **UPS / power monitoring** — detect outages, track per-device energy consumption
- **MCU boards** — JTAG/SWD debug probes, different power cycling strategies
- **Full CI integration** — webhook → power cycle → flash → test → report; same primitives, more pipeline
- **Remote serial alternatives** — `ser2net` or `socat` (TCP port per UART), `usbip` (expose USB devices over the network) if SSH-based access doesn't fit your workflow
- **Serial console in HA** — pipe `ser2net` output to HA sensors, alert on keywords like `"kernel panic"`, correlate serial events with power events on a timeline
- **Deeper HA integration** — automations, mobile notifications, board health tracking via MQTT sensors, alert when a board goes silent

::: notes
These didn't make the main flow but are worth mentioning so attendees know
the pattern extends further. Environmental monitoring is the most commonly
requested — point them to the HA + ESPHome path if they want it.
:::
