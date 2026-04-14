## My Lab Machines

- **NUC-style PC (Ubuntu)** — always-on Docker host; runs Home Assistant and supporting services
- **Threadripper (ucore-hci)** — heavy lifting: Yocto builds, CI runners, fast `bitbake` parallelism
- **Raspberry Pi 5** — board farm controller; manages USB serial adapters, coordinates power control
- **PiKVM** — dedicated KVM-over-IP; receives HDMI via switch+splitter for remote display access

Your setup will almost certainly look different — the key is separating
**always-on services** from **compute** from **physical board interfacing**.

::: notes
Don't dwell on the specific hardware choices — the point is the separation of
concerns, not the exact machines. ucore-hci may need a brief explanation
(immutable Fedora CoreOS variant) if the audience isn't familiar.
:::
