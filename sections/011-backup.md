## Backup Slides {.section-divider}

---

## MQTT Primer

:::: {.slide-columns}
::: {.slide-col-left}
- Publish/subscribe messaging protocol
- Lightweight — designed for IoT
- Broker (Mosquitto) runs on your HA host
- Topics are path-like: `lab/boards/rpi4/cpu_temp`
- QoS levels for reliability guarantees
- Retained messages for last-known-good state
:::
::: {.slide-col-right}
::::: {.code-window}
:::: {.code-window-titlebar}
[]{.cw-dot .cw-red}[]{.cw-dot .cw-yellow}[]{.cw-dot .cw-green}[publish example]{.cw-filename}
::::

~~~bash
# Publish a value
mosquitto_pub \
  -h homeassistant.local \
  -t lab/boards/rpi4/cpu_temp \
  -m 52.3

# Subscribe to all lab topics
mosquitto_sub \
  -h homeassistant.local \
  -t "lab/#" -v
~~~

:::::
:::
::::

---

## Tasmota Flashing

::::: {.code-window}
:::: {.code-window-titlebar}
[]{.cw-dot .cw-red}[]{.cw-dot .cw-yellow}[]{.cw-dot .cw-green}[flash via tasmota-device-manager]{.cw-filename}
::::

~~~bash
# Using tasmota-device-manager (Python)
pip install tasmota-device-manager
tdm --host 192.168.1.x --firmware tasmota.bin
~~~

:::::

- Or use web flasher at tasmota.github.io/install (no software needed)
- Hold button during power-on to enter flash mode on most Sonoff devices
- After flash: configure WiFi via captive portal → connect to your network

---

## Home Assistant MQTT Auto-Discovery

::::: {.code-window}
:::: {.code-window-titlebar}
[]{.cw-dot .cw-red}[]{.cw-dot .cw-yellow}[]{.cw-dot .cw-green}[discovery payload]{.cw-filename}
::::

~~~json
{
  "name": "rpi4 CPU Temp",
  "state_topic": "lab/boards/rpi4/cpu_temp",
  "unit_of_measurement": "°C",
  "device_class": "temperature",
  "unique_id": "rpi4_cpu_temp"
}
~~~

:::::

Publish this to `homeassistant/sensor/rpi4_cpu_temp/config` once — HA discovers the sensor automatically. No YAML editing required.
