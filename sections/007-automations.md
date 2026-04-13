## Automations That Improve Dev Flow {.section-title}

---

## The Automation Catalog

<div class="hw-cards">
  <div class="hw-card">
    <div class="hw-card-title">Board Watchdog</div>
    <ul>
      <li>Detect silent boards</li>
      <li>Auto power cycle</li>
      <li>Push notification</li>
    </ul>
  </div>
  <div class="hw-card">
    <div class="hw-card-title">Test Sequencer</div>
    <ul>
      <li>Flash → boot → test → log</li>
      <li>Power-controlled reset between runs</li>
      <li>Results posted to chat</li>
    </ul>
  </div>
  <div class="hw-card">
    <div class="hw-card-title">Lab Presence</div>
    <ul>
      <li>Spin up build VM on arrival</li>
      <li>Suspend when you leave</li>
      <li>Quiet hours for fans/noise</li>
    </ul>
  </div>
</div>

---

## Tying It All Together: Flash → Test → Report

:::: {.slide-columns}
::: {.slide-col-left}
1. CI pushes new image to registry
2. Webhook triggers HA script
3. Script powers off board (Tasmota)
4. New image flashed via USB/network
5. Board powered on
6. Wait for SSH (poll)
7. Run test suite over SSH
8. Post results to Slack / Matrix
9. Power off to save energy
:::
::: {.slide-col-right}
::::: {.code-window}
:::: {.code-window-titlebar}
[]{.cw-dot .cw-red}[]{.cw-dot .cw-yellow}[]{.cw-dot .cw-green}[test-sequence.sh]{.cw-filename}
::::

~~~bash
#!/bin/bash
set -e
BOARD=rpi4-dev
HA=http://homeassistant.local:8123

# Power cycle
curl -X POST $HA/api/services/switch/turn_off \
  -d '{"entity_id":"switch.'"$BOARD"'_power"}'
sleep 5
curl -X POST $HA/api/services/switch/turn_on \
  -d '{"entity_id":"switch.'"$BOARD"'_power"}'

# Wait for SSH
until ssh -o ConnectTimeout=2 $BOARD true 2>/dev/null
do sleep 5; done

# Run tests
ssh $BOARD ./run-tests.sh
~~~

:::::
:::
::::
