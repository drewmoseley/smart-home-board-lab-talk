## Home Assistant {.section-title}

---

## Why Home Assistant?

:::: {.slide-columns}
::: {.slide-col-left}
- Open source, runs locally — no cloud dependency
- Huge device ecosystem (Matter, Zigbee, Z-Wave, MQTT, REST)
- Powerful automation engine
- Dashboard builder for at-a-glance lab status
- Active community with embedded / maker integrations
:::
::: {.slide-col-right}
::::: {.code-window}
:::: {.code-window-titlebar}
[]{.cw-dot .cw-red}[]{.cw-dot .cw-yellow}[]{.cw-dot .cw-green}[docker-compose.yml]{.cw-filename}
::::

~~~yaml
services:
  homeassistant:
    image: ghcr.io/home-assistant/home-assistant:stable
    network_mode: host
    volumes:
      - ./config:/config
    restart: unless-stopped
~~~

:::::
:::
::::

---

## Boards as First-Class Citizens

- Expose board metrics via **MQTT** or REST → HA sensors
- Track: CPU temp, load, memory, uptime, last-seen
- Alert when a board goes silent (hung or powered off)
- Dashboard view: which boards are alive right now

::: notes
Toradex boards running TorizonCore can publish MQTT metrics out of the box with a container. Raspberry Pi: same pattern with a small Python agent.
:::

---

## Home Assistant Dashboard: Lab View

![Home Assistant lab dashboard — board power switches, recovery mode toggles, Tasmota energy monitoring](img/homeassistant.png)
