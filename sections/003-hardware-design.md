---

## Physical Design {.section-title}

---

## Self-Contained Board Units

Size constraints drove a key design decision: **each board lives in its own unit**
with a single power, ethernet, and USB connection to the outside world.

:::: {.slide-columns}
::: {.slide-col-left}
**Inside each unit:**

- The target board
- Relay board (Tasmota) — power + recovery mode control
- USB hub — serial adapters, storage, peripherals
- Ethernet switch — single uplink to the lab network
- Buck converters — step down from a single 10W+ laptop PSU

**One cable in, everything powered and connected.**
:::
::: {.slide-col-right}
<!-- photo goes here -->
:::
::::

::: notes
The single-PSU + buck converter approach keeps cabling tidy and makes each
unit self-contained — easy to add or remove a board without disturbing the rest
of the farm. Laptop PSUs are cheap, safe, and widely available.
:::
