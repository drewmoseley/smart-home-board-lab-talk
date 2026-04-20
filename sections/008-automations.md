## Simple Shell Glue

This is a **personal dev farm** — not a replacement for a full automated test lab.
Automations don't need to be complex to be useful.

:::: {.slide-columns}
::: {.slide-col-left}
::::: {.code-window}
:::: {.code-window-titlebar}
[]{.cw-dot .cw-red}[]{.cw-dot .cw-yellow}[]{.cw-dot .cw-green}[flash-board]{.cw-filename}
::::

~~~bash
ha-switch.sh "${MACHINE}" recovery

ssh bfc1 ./flash.sh "${MACHINE}"

serial-term "${MACHINE}"

ha-switch.sh "${MACHINE}" recovery_off
~~~

:::::
:::
::: {.slide-col-right}
**HA controls hardware state**
Power, boot mode GPIOs — via REST API

**Pi 5 does the work**
SSH in, run your tooling locally

**Watch it happen**
Serial console — always reachable

**Restore normal boot**
HA flips the GPIO back
:::
::::

Chain these however you need. Full CI integration is possible — it's just not what I need.

::: notes
The point isn't the specific script — it's that HA power/mode control, SSH to
the Pi 5, and serial access are composable primitives. The same three building
blocks scale up to a full flash → test → report pipeline.
:::
