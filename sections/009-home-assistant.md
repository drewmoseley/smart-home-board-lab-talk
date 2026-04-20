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

## Home Assistant Dashboard: Lab View

![Home Assistant lab dashboard — board power switches, recovery mode toggles, Tasmota energy monitoring](img/homeassistant.png)
