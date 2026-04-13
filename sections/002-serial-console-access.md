## Serial Console Access {.section-title}

---

## The Console You Can Always Reach

SSH is convenient — until you break networking. Or the bootloader. Or the kernel.

**Serial console (UART) survives all of that:**

- Visible before the kernel starts
- Visible when networking is down
- Visible during a kernel panic
- Visible when you accidentally `iptables -F DROP`

> If you're changing bootloaders, kernels, initramfs, or networking,
> you need a console that survives those changes.

::: notes
This is the single most important piece of infrastructure in the lab. Everything else is quality of life. This is correctness.
:::

---

## Hardware: USB Serial Adapters

:::: {.slide-columns}
::: {.slide-col-left}
**What you need:**

- USB-to-UART adapter (CP2102, CH340, FTDI)
- ~$5–10 each
- Connect to board's UART TX/RX/GND pins
- Plug into your lab server (Raspberry Pi, Proxmox host)

**Common boards:**

| Board | UART header |
|---|---|
| Toradex Verdin | X1 debug connector |
| Raspberry Pi | GPIO 14/15 |
| BeagleBone | J1 debug header |
:::
::: {.slide-col-right}
::::: {.code-window}
:::: {.code-window-titlebar}
[]{.cw-dot .cw-red}[]{.cw-dot .cw-yellow}[]{.cw-dot .cw-green}[connect via minicom]{.cw-filename}
::::

~~~bash
# Find the device
ls /dev/ttyUSB* /dev/ttyACM*

# Connect (115200 is the most common baud rate)
minicom -D /dev/ttyUSB0 -b 115200

# Or with screen
screen /dev/ttyUSB0 115200

# Or with picocom (no flow control)
picocom -b 115200 --flow none /dev/ttyUSB0
~~~

:::::
:::
::::

---

## Remote Serial: ser2net

Expose the UART over TCP so you can reach it from anywhere on your network — or over a VPN.

:::: {.slide-columns}
::: {.slide-col-left}
- `ser2net` runs on your lab server (Pi, Proxmox LXC)
- Maps each UART to a TCP port
- Connect with `telnet` or `minicom` from any machine
- Works over WireGuard / Tailscale for truly remote access
:::
::: {.slide-col-right}
::::: {.code-window}
:::: {.code-window-titlebar}
[]{.cw-dot .cw-red}[]{.cw-dot .cw-yellow}[]{.cw-dot .cw-green}[/etc/ser2net.yaml]{.cw-filename}
::::

~~~yaml
connection: &toradex1
  accepter: tcp,3001
  connector: serialdev,/dev/ttyUSB0,115200n81
  options:
    kickolduser: true

connection: &rpi4
  accepter: tcp,3002
  connector: serialdev,/dev/ttyUSB1,115200n81
  options:
    kickolduser: true
~~~

:::::
:::
::::

---

## Persistent Device Names with udev

USB adapters enumerate as `/dev/ttyUSB0`, `/dev/ttyUSB1`… in plug-in order. That changes on reboot.

::::: {.code-window}
:::: {.code-window-titlebar}
[]{.cw-dot .cw-red}[]{.cw-dot .cw-yellow}[]{.cw-dot .cw-green}[/etc/udev/rules.d/99-serial-boards.rules]{.cw-filename}
::::

~~~
# Get idVendor/idProduct/serial from: udevadm info /dev/ttyUSB0
SUBSYSTEM=="tty", \
  ATTRS{idVendor}=="10c4", ATTRS{idProduct}=="ea60", \
  ATTRS{serial}=="0001", \
  SYMLINK+="tty-toradex1"

SUBSYSTEM=="tty", \
  ATTRS{idVendor}=="10c4", ATTRS{idProduct}=="ea60", \
  ATTRS{serial}=="0002", \
  SYMLINK+="tty-rpi4"
~~~

:::::

Now `ser2net.yaml` references `/dev/tty-toradex1` — stable across reboots and replug.

---

## Serial Console in Home Assistant

- `ser2net` TCP ports → HA terminal card or REST sensor
- Log serial output to files → searchable later
- Alert on keywords in serial stream: `"kernel panic"`, `"Oops"`, `"reboot"`
- Correlate serial events with power events (Tasmota) on a timeline

::: notes
This closes the loop — serial console isn't just a manual debug tool, it feeds data back into the automation system.
:::
