## Board Access {.section-title}

---

## The Board Farm Controller

**Raspberry Pi 5** — the physical hub of the lab

- Hosts all USB serial adapters (one per board)
- Stable device names via udev symlinks
- Accessible via SSH for remote serial sessions
- Runs recovery boot sequences for flashing (TEZI)

Everything in this section runs on or through the Pi 5.

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

## Remote Serial: SSH + picocom

No TCP port exposure needed — SSH into the board farm controller and run picocom directly.

:::: {.slide-columns}
::: {.slide-col-left}
- `serial-term` on your workstation SSHes to the Pi 5
- Runs `serial-term-local` on the controller
- Pass a device name, or get a `dialog` menu of available ports
- Works over VPN for truly remote access
:::
::: {.slide-col-right}
::::: {.code-window}
:::: {.code-window-titlebar}
[]{.cw-dot .cw-red}[]{.cw-dot .cw-yellow}[]{.cw-dot .cw-green}[serial-term]{.cw-filename}
::::

~~~bash
# Connect to a named board
serial-term verdin-imx8mp

# Or pick from a menu of available ports
serial-term
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

## Display Access: HDMI Switch + PiKVM

Serial gives you the console — but sometimes you need the **display output** (installer UI, framebuffer apps, early GPU init).

```{=html}
<svg viewBox="0 0 820 230" xmlns="http://www.w3.org/2000/svg" style="width:85%; display:block; margin:0.5em auto;" font-family="sans-serif">
  <defs>
    <marker id="arr" markerWidth="8" markerHeight="6" refX="7" refY="3" orient="auto">
      <polygon points="0 0, 8 3, 0 6" fill="#003b64"/>
    </marker>
  </defs>

  <!-- Boards -->
  <rect x="0"   y="5"   width="120" height="44" rx="4" fill="none" stroke="#003b64" stroke-width="2"/>
  <text x="60"  y="24"  text-anchor="middle" fill="#003b64" font-size="14" font-weight="bold">Board 1</text>
  <text x="60"  y="41"  text-anchor="middle" fill="#555"    font-size="11">HDMI + USB</text>

  <rect x="0"   y="62"  width="120" height="44" rx="4" fill="none" stroke="#003b64" stroke-width="2"/>
  <text x="60"  y="81"  text-anchor="middle" fill="#003b64" font-size="14" font-weight="bold">Board 2</text>
  <text x="60"  y="98"  text-anchor="middle" fill="#555"    font-size="11">HDMI + USB</text>

  <rect x="0"   y="119" width="120" height="44" rx="4" fill="none" stroke="#003b64" stroke-width="2"/>
  <text x="60"  y="138" text-anchor="middle" fill="#003b64" font-size="14" font-weight="bold">Board 3</text>
  <text x="60"  y="155" text-anchor="middle" fill="#555"    font-size="11">HDMI + USB</text>

  <rect x="0"   y="176" width="120" height="44" rx="4" fill="none" stroke="#003b64" stroke-width="2"/>
  <text x="60"  y="195" text-anchor="middle" fill="#003b64" font-size="14" font-weight="bold">Board 4</text>
  <text x="60"  y="212" text-anchor="middle" fill="#555"    font-size="11">HDMI + USB</text>

  <!-- Arrows: boards → KVM switch -->
  <line x1="120" y1="27"  x2="218" y2="105" stroke="#003b64" stroke-width="1.5" marker-end="url(#arr)"/>
  <line x1="120" y1="84"  x2="218" y2="108" stroke="#003b64" stroke-width="1.5" marker-end="url(#arr)"/>
  <line x1="120" y1="141" x2="218" y2="115" stroke="#003b64" stroke-width="1.5" marker-end="url(#arr)"/>
  <line x1="120" y1="198" x2="218" y2="118" stroke="#003b64" stroke-width="1.5" marker-end="url(#arr)"/>

  <!-- KVM Switch -->
  <rect x="220" y="88"  width="140" height="50" rx="4" fill="none" stroke="#003b64" stroke-width="2"/>
  <text x="290" y="109" text-anchor="middle" fill="#003b64" font-size="14" font-weight="bold">4-Port</text>
  <text x="290" y="128" text-anchor="middle" fill="#003b64" font-size="14" font-weight="bold">KVM Switch</text>

  <!-- Arrow: KVM → splitter -->
  <line x1="360" y1="113" x2="418" y2="113" stroke="#003b64" stroke-width="1.5" marker-end="url(#arr)"/>

  <!-- HDMI Splitter -->
  <rect x="420" y="88"  width="140" height="50" rx="4" fill="none" stroke="#003b64" stroke-width="2"/>
  <text x="490" y="109" text-anchor="middle" fill="#003b64" font-size="14" font-weight="bold">2-Port</text>
  <text x="490" y="128" text-anchor="middle" fill="#003b64" font-size="14" font-weight="bold">HDMI Splitter</text>

  <!-- Arrows: splitter → outputs -->
  <line x1="560" y1="105" x2="648" y2="78"  stroke="#003b64" stroke-width="1.5" marker-end="url(#arr)"/>
  <line x1="560" y1="121" x2="648" y2="150" stroke="#003b64" stroke-width="1.5" marker-end="url(#arr)"/>

  <!-- Outputs -->
  <rect x="650" y="55"  width="140" height="44" rx="4" fill="none" stroke="#003b64" stroke-width="2"/>
  <text x="720" y="81"  text-anchor="middle" fill="#003b64" font-size="14" font-weight="bold">Local Monitor</text>

  <rect x="650" y="128" width="140" height="50" rx="4" fill="none" stroke="#003b64" stroke-width="2"/>
  <text x="720" y="149" text-anchor="middle" fill="#003b64" font-size="14" font-weight="bold">PiKVM</text>
  <text x="720" y="168" text-anchor="middle" fill="#555"    font-size="11">KVM over IP</text>
</svg>
```

- PiKVM: browser-based, keyboard/mouse emulation, works over VPN
- Used for TEZI installer UI, BIOS/UEFI, early boot issues
- Any board's display reachable locally or remotely — no cable moves

---

## Serial Console in Home Assistant

- `ser2net` TCP ports → HA terminal card or REST sensor
- Log serial output to files → searchable later
- Alert on keywords in serial stream: `"kernel panic"`, `"Oops"`, `"reboot"`
- Correlate serial events with power events (Tasmota) on a timeline

::: notes
This closes the loop — serial console isn't just a manual debug tool, it feeds data back into the automation system.
:::
