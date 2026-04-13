## Environmental Monitoring {.section-title}

---

## Why Temperature Matters in Embedded Dev

- SoCs throttle at defined thermal limits — test results vary by ambient temp
- Thermal regression tests need repeatable conditions
- Long burn-in tests need monitoring — you shouldn't babysit them
- Some boards have passive cooling that depends on airflow

---

## Sensors in the Lab

<div class="hw-cards">
  <div class="hw-card">
    <div class="hw-card-title">Temperature / Humidity</div>
    <ul>
      <li>Zigbee sensors (IKEA, Aqara)</li>
      <li>Sub-$10 each</li>
      <li>Battery-powered, no wiring</li>
    </ul>
  </div>
  <div class="hw-card">
    <div class="hw-card-title">Board Thermals</div>
    <ul>
      <li>Read via <code>/sys/class/thermal</code></li>
      <li>Published as MQTT sensor</li>
      <li>Graphed in HA history</li>
    </ul>
  </div>
  <div class="hw-card">
    <div class="hw-card-title">HVAC Integration</div>
    <ul>
      <li>Trigger A/C before long test runs</li>
      <li>Alert if lab exceeds threshold</li>
      <li>Correlate failures with temp spikes</li>
    </ul>
  </div>
</div>

---

## Thermal Test Workflow

:::: {.slide-columns}
::: {.slide-col-left}
**Before the test:**

1. HA checks ambient temp sensor
2. If > threshold: trigger HVAC, wait
3. Log starting conditions

**During the test:**

- Stream board thermals to InfluxDB / HA history
- Alert on throttle events

**After the test:**

- Annotate results with thermal context
- Flag runs where ambient was out of range
:::
::: {.slide-col-right}
::::: {.code-window}
:::: {.code-window-titlebar}
[]{.cw-dot .cw-red}[]{.cw-dot .cw-yellow}[]{.cw-dot .cw-green}[thermal-sensor.py]{.cw-filename}
::::

~~~python
import paho.mqtt.client as mqtt
import time, pathlib

TOPIC = "lab/boards/toradex1/thermal"

def read_temp():
    p = pathlib.Path(
        "/sys/class/thermal/thermal_zone0/temp")
    return int(p.read_text()) / 1000

client = mqtt.Client()
client.connect("homeassistant.local")

while True:
    client.publish(TOPIC, read_temp())
    time.sleep(10)
~~~

:::::
:::
::::
