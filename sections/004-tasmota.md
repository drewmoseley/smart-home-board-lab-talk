## Power Control with Tasmota {.section-title}

---

## What Is Tasmota?

- Open source firmware for ESP8266/ESP32-based smart plugs
- Replace cloud-locked firmware with local MQTT control
- Flash once → full local control, no cloud account
- Integrates directly with Home Assistant via MQTT auto-discovery

**Typical hardware: ~$10–15 per outlet**

---

## Remote Power Cycling

:::: {.slide-columns}
::: {.slide-col-left}
**The workflow:**

1. Board stops responding
2. HA automation detects silence (last-seen > threshold)
3. Triggers power-off on Tasmota outlet
4. Waits 5 seconds
5. Powers back on
6. Sends notification: "Board rpi4-dev restarted"

No desk visit required.
:::
::: {.slide-col-right}
::::: {.code-window}
:::: {.code-window-titlebar}
[]{.cw-dot .cw-red}[]{.cw-dot .cw-yellow}[]{.cw-dot .cw-green}[automation.yaml]{.cw-filename}
::::

~~~yaml
trigger:
  - platform: template
    value_template: >
      {{ (now() - states.sensor.rpi4_last_seen
          .last_changed).seconds > 300 }}
action:
  - service: switch.turn_off
    target:
      entity_id: switch.rpi4_power
  - delay: "00:00:05"
  - service: switch.turn_on
    target:
      entity_id: switch.rpi4_power
  - service: notify.mobile_app
    data:
      message: "rpi4-dev auto-restarted"
~~~

:::::
:::
::::

---

## Automated Test Sequencing

- Power cycle board → wait for SSH → run test suite → log result
- Tasmota energy monitoring: track power draw during tests
- Detect abnormal current (crash loops, kernel panic)
- Multi-outlet strips: sequence power to dependent hardware (board → peripherals → load)
