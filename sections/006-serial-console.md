## Serial Console Access

SSH breaks when networking, the kernel, or the bootloader breaks. **UART survives all of that.**

:::: {.slide-columns}
::: {.slide-col-left}
**Why serial:**

- Visible before the kernel starts
- Visible during a kernel panic
- Visible when networking is down

**Hardware:** USB-to-UART adapter per board (CP2102, CH340, FTDI — ~$5–10 each)

**Stable names via udev** — adapters get symlinks like `/dev/tty-verdin1` regardless of plug order

**Remote access:** `serial-term` SSHes to the Pi 5 and launches picocom — works over VPN, no open TCP ports
:::
::: {.slide-col-right}
::::: {.code-window}
:::: {.code-window-titlebar}
[]{.cw-dot .cw-red}[]{.cw-dot .cw-yellow}[]{.cw-dot .cw-green}[99-serial-boards.rules]{.cw-filename}
::::

~~~
SUBSYSTEM=="tty", \
  ATTRS{idVendor}=="10c4", \
  ATTRS{idProduct}=="ea60", \
  ATTRS{serial}=="0001", \
  SYMLINK+="tty-verdin1"
~~~

:::::

::::: {.code-window}
:::: {.code-window-titlebar}
[]{.cw-dot .cw-red}[]{.cw-dot .cw-yellow}[]{.cw-dot .cw-green}[serial-term]{.cw-filename}
::::

~~~bash
# Named board or interactive menu
serial-term verdin-imx8mp
serial-term
~~~

:::::
:::
::::

::: notes
This is the single most important piece of infrastructure in the lab. Everything else is quality of life. This is correctness.
:::
