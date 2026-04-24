## Simple Shell Glue

This is a **personal dev farm** — not a replacement for a full automated test lab.
Automations don't need to be complex to be useful.

:::: {.slide-columns .shell-glue-columns}
::: {.slide-col-left}
::::: {.code-window .shell-glue-codewindow}
:::: {.code-window-titlebar}
[]{.cw-dot .cw-red}[]{.cw-dot .cw-yellow}[]{.cw-dot .cw-green}[flash-board]{.cw-filename}
::::

~~~{.bash .numberLines}
ha-switch.sh "${MACHINE}" recovery
ssh bfc1 ./flash.sh "${MACHINE}"
serial-term "${MACHINE}"
ha-switch.sh "${MACHINE}" recovery_off
~~~

:::::
:::
::: {.slide-col-right .shell-glue-steps}
<div class="shell-step"><span class="shell-step-num">01</span><strong>HA controls hardware state</strong><span>Power, boot mode GPIOs — via REST API</span></div>
<div class="shell-step"><span class="shell-step-num">02</span><strong>Pi 5 does the work</strong><span>SSH in, run your tooling locally</span></div>
<div class="shell-step"><span class="shell-step-num">03</span><strong>Watch it happen</strong><span>Serial console — always reachable</span></div>
<div class="shell-step"><span class="shell-step-num">04</span><strong>Restore normal boot</strong><span>HA flips the GPIO back</span></div>
:::
::::

Chain these however you need. Full CI integration is possible — it's just not what I need.

::: notes
The point isn't the specific script — it's that HA power/mode control, SSH to
the Pi 5, and serial access are composable primitives. The same three building
blocks scale up to a full flash → test → report pipeline.
:::
