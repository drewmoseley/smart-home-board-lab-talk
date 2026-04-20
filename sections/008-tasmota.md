## Power Control with Tasmota

:::: {.slide-columns}
::: {.slide-col-left}
![ESP12F\_Relay\_X4 — ~$15 on AliExpress](img/relay_board.jpg)

![Tasmota web UI — 4 relays + 3 recovery mode GPIOs](img/tasmota-switch-cropped.png)
:::
::: {.slide-col-right}
**Tasmota** — open source firmware for ESP8266/ESP32 devices

- Flash once → full local control, no cloud dependency
- MQTT auto-discovery → each relay/GPIO appears as a HA switch entity
- Scriptable via HA REST API or direct MQTT

**ESP12F\_Relay\_X4** (~$15):

- 4 relays → switched power, one per board
- 3 extra GPIOs → wired to Toradex **recovery mode pins**

::::: {.code-window}
:::: {.code-window-titlebar}
[]{.cw-dot .cw-red}[]{.cw-dot .cw-yellow}[]{.cw-dot .cw-green}[ha-switch.sh]{.cw-filename}
::::

~~~bash
# Set boot mode, power cycle, restore
ha-switch.sh verdin1 recovery
ha-switch.sh verdin1 power off
ha-switch.sh verdin1 power on
ha-switch.sh verdin1 recovery_off
~~~

:::::

Replaces a power strip + manual jumper with a **single scriptable device**.
:::
::::

::: notes
The recovery mode GPIO is the killer feature — without it you'd need physical
access to hold a button or move a jumper to enter recovery mode for flashing.
With the extra GPIOs wired to the recovery pin, the whole flash sequence
(set recovery mode, power cycle, flash, restore normal boot) is fully scriptable.
:::

