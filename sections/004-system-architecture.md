## System Architecture

```{=html}
<svg viewBox="0 0 870 435" xmlns="http://www.w3.org/2000/svg"
     style="width:90%;display:block;margin:0.5em auto;" font-family="sans-serif">
  <defs>
    <marker id="ab" markerWidth="8" markerHeight="6" refX="7" refY="3" orient="auto">
      <polygon points="0 0, 8 3, 0 6" fill="#003b64"/>
    </marker>
    <marker id="ag" markerWidth="8" markerHeight="6" refX="7" refY="3" orient="auto">
      <polygon points="0 0, 8 3, 0 6" fill="#8dc63f"/>
    </marker>
  </defs>

  <!-- Home Assistant (top centre) -->
  <rect x="305" y="10" width="250" height="65" rx="6" fill="#eef3f8" stroke="#003b64" stroke-width="2.5"/>
  <text x="430" y="37" text-anchor="middle" fill="#003b64" font-size="15" font-weight="bold">Home Assistant</text>
  <text x="430" y="57" text-anchor="middle" fill="#555" font-size="12">NUC · Docker · always-on</text>

  <!-- Tasmota -->
  <rect x="40" y="175" width="160" height="60" rx="6" fill="#eef3f8" stroke="#003b64" stroke-width="2"/>
  <text x="120" y="201" text-anchor="middle" fill="#003b64" font-size="14" font-weight="bold">Tasmota</text>
  <text x="120" y="221" text-anchor="middle" fill="#555" font-size="11">ESP12F relay board</text>

  <!-- Pi 5 -->
  <rect x="350" y="175" width="160" height="60" rx="6" fill="#eef3f8" stroke="#003b64" stroke-width="2"/>
  <text x="430" y="201" text-anchor="middle" fill="#003b64" font-size="14" font-weight="bold">Raspberry Pi 5</text>
  <text x="430" y="221" text-anchor="middle" fill="#555" font-size="11">Board farm controller</text>

  <!-- HDMI Switch -->
  <rect x="570" y="175" width="120" height="60" rx="6" fill="#eef3f8" stroke="#003b64" stroke-width="2"/>
  <text x="630" y="199" text-anchor="middle" fill="#003b64" font-size="13" font-weight="bold">HDMI Switch</text>
  <text x="630" y="217" text-anchor="middle" fill="#555" font-size="11">4-port</text>
  <text x="630" y="231" text-anchor="middle" fill="#555" font-size="10">(some boards)</text>

  <!-- PiKVM -->
  <rect x="710" y="175" width="130" height="60" rx="6" fill="#eef3f8" stroke="#003b64" stroke-width="2"/>
  <text x="775" y="201" text-anchor="middle" fill="#003b64" font-size="14" font-weight="bold">PiKVM</text>
  <text x="775" y="221" text-anchor="middle" fill="#555" font-size="11">KVM over IP</text>

  <!-- Target Boards — stacked rectangles (draw back-to-front) -->
  <rect x="56" y="356" width="534" height="58" rx="6" fill="#c8d8ec" stroke="#8dc63f" stroke-width="1.5"/>
  <rect x="48" y="348" width="534" height="58" rx="6" fill="#dce8f4" stroke="#8dc63f" stroke-width="1.5"/>
  <rect x="40" y="340" width="534" height="58" rx="6" fill="#eef3f8" stroke="#8dc63f" stroke-width="2.5"/>
  <text x="307" y="366" text-anchor="middle" fill="#003b64" font-size="15" font-weight="bold">Target Boards</text>
  <text x="307" y="386" text-anchor="middle" fill="#555" font-size="12">SBCs running Linux · one USB-UART + relay per board</text>

  <!-- DSI Display (one board) -->
  <rect x="640" y="340" width="120" height="58" rx="6" fill="#eef3f8" stroke="#8dc63f" stroke-width="1.5" stroke-dasharray="4,2"/>
  <text x="700" y="365" text-anchor="middle" fill="#003b64" font-size="13" font-weight="bold">DSI Display</text>
  <text x="700" y="383" text-anchor="middle" fill="#555" font-size="11">(one board)</text>

  <!-- HA → Tasmota (MQTT) -->
  <line x1="355" y1="72" x2="195" y2="175" stroke="#003b64" stroke-width="1.5" stroke-dasharray="5,3" marker-end="url(#ab)"/>
  <!-- label offset above-left of the line midpoint -->
  <text x="258" y="102" text-anchor="middle" fill="#003b64" font-size="11">MQTT</text>

  <!-- HA → Pi 5 (SSH) -->
  <line x1="430" y1="75" x2="430" y2="175" stroke="#003b64" stroke-width="1.5" stroke-dasharray="5,3" marker-end="url(#ab)"/>
  <text x="444" y="130" fill="#003b64" font-size="11">SSH</text>

  <!-- HA → PiKVM (network) -->
  <line x1="505" y1="72" x2="748" y2="175" stroke="#003b64" stroke-width="1.5" stroke-dasharray="5,3" marker-end="url(#ab)"/>
  <!-- label offset above the line midpoint -->
  <text x="618" y="102" text-anchor="middle" fill="#003b64" font-size="11">Network</text>

  <!-- HDMI Switch → PiKVM -->
  <line x1="690" y1="205" x2="710" y2="205" stroke="#003b64" stroke-width="1.5" marker-end="url(#ab)"/>

  <!-- Tasmota → all boards (power) -->
  <line x1="120" y1="235" x2="120" y2="340" stroke="#8dc63f" stroke-width="2" marker-end="url(#ag)"/>
  <!-- label to the left of the vertical line -->
  <text x="112" y="291" text-anchor="end" fill="#8dc63f" font-size="11" font-weight="bold">Power</text>
  <text x="112" y="305" text-anchor="end" fill="#8dc63f" font-size="11" font-weight="bold">(all boards)</text>

  <!-- Pi 5 → all boards (USB serial) -->
  <line x1="415" y1="235" x2="360" y2="340" stroke="#8dc63f" stroke-width="2" marker-end="url(#ag)"/>
  <!-- label to the left of the line -->
  <text x="350" y="282" text-anchor="end" fill="#8dc63f" font-size="11" font-weight="bold">USB serial</text>
  <text x="350" y="296" text-anchor="end" fill="#8dc63f" font-size="11" font-weight="bold">(all boards)</text>

  <!-- Pi 5 → Toradex boards (recovery USB) -->
  <line x1="445" y1="235" x2="430" y2="340" stroke="#8dc63f" stroke-width="2" stroke-dasharray="5,3" marker-end="url(#ag)"/>
  <!-- label to the right of the line -->
  <text x="455" y="282" fill="#8dc63f" font-size="11" font-weight="bold">Recovery USB</text>
  <text x="455" y="296" fill="#8dc63f" font-size="11" font-weight="bold">(Toradex)</text>

  <!-- HDMI Switch → some boards -->
  <line x1="615" y1="235" x2="520" y2="340" stroke="#8dc63f" stroke-width="1.5" stroke-dasharray="5,3" marker-end="url(#ag)"/>
  <!-- label to the right of the line, clearly separated from recovery USB -->
  <text x="622" y="282" text-anchor="middle" fill="#8dc63f" font-size="11">HDMI</text>
  <text x="622" y="296" text-anchor="middle" fill="#8dc63f" font-size="11">(some boards)</text>

  <!-- Board → DSI Display -->
  <line x1="574" y1="369" x2="640" y2="369" stroke="#8dc63f" stroke-width="1.5" stroke-dasharray="4,2" marker-end="url(#ag)"/>
  <text x="607" y="362" text-anchor="middle" fill="#8dc63f" font-size="10">DSI</text>
</svg>
```

::: notes
Walk through each interface: Tasmota handles power for every board, Pi 5 handles
serial console for every board plus recovery USB for Toradex boards,
HDMI switch and PiKVM handle display for boards that need it.
One board also has a DSI display connected directly.
HA sits above all three as the coordination layer.
:::

