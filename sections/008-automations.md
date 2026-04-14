---

## Scripted Workflows {.section-title}

---

## Simple Shell Glue

This is a **personal dev farm** — not a replacement for a full automated test lab.
Automations don't need to be complex to be useful.

::::: {.code-window}
:::: {.code-window-titlebar}
[]{.cw-dot .cw-red}[]{.cw-dot .cw-yellow}[]{.cw-dot .cw-green}[tezi]{.cw-filename}
::::

~~~bash
# Put board into recovery mode via Home Assistant
ha-switch.sh "${MACHINE}" recovery

# Boot TEZI on the board farm controller
ssh bfc1 "cd ~/tezi/${PREFIX}_* && ./recovery-linux.sh -q"

# Open VNC to interact with the installer
"${VNCVIEWER}" "${FQDN}"

# Exit recovery mode
ha-switch.sh "${MACHINE}" recovery_off
~~~

:::::

The building blocks — HA power/mode control, SSH, local tooling — compose into
whatever workflow you need. Full CI integration is possible; it's just not what I need.

::: notes
Walk through what ha-switch.sh does: hits the HA REST API to toggle a switch
entity that controls recovery mode (likely a GPIO or smart plug). The script
also optionally spins up a local TEZI feed web server over SSH.

Key message: the same primitives scale up to a full Flash → Test → Report
pipeline if that's your requirement.
:::
