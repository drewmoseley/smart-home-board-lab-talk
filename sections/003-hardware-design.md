---

## Physical Design {.section-title}

---

## Self-Contained Board Units

Size constraints drove a key design decision: **each board lives in its own unit** with a single power, ethernet, and USB connection to the outside world.

:::: {.slide-columns}
::: {.slide-col-left}
![Boards mounted in unit](img/board-farm-top.png)
:::
::: {.slide-col-right}
![Power and wiring layer](img/board-farm-guts.png)
:::
::::

**Inside each unit:** target board, relay board (Tasmota), USB hub, ethernet switch, buck converters from a single 10W+ laptop PSU.

::: notes
The single-PSU + buck converter approach keeps cabling tidy and makes each
unit self-contained — easy to add or remove a board without disturbing the rest
of the farm. Laptop PSUs are cheap, safe, and widely available.
:::
