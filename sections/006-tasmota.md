## Power Control with Tasmota

:::: {.slide-columns}
::: {.slide-col-left}
![ESP12F\_Relay\_X4 — ~$15 on AliExpress](img/relay_board.jpg)

![Tasmota web UI — 4 relays + 3 recovery mode GPIOs](img/tasmota-switch-cropped.png)
:::
::: {.slide-col-right}
**Tasmota** — open source firmware for ESP8266/ESP32 devices

- Flash once → full local control, no cloud account
- Integrates with Home Assistant via MQTT auto-discovery
- Each relay/GPIO appears as a switch entity in HA

**ESP12F\_Relay\_X4:**

- 4 relays — switched power to each board
- 3 extra GPIOs — wired to Toradex recovery mode pins

Replaces a power strip + manual jumper with a single scriptable device. **~$15 on AliExpress.**
:::
::::

