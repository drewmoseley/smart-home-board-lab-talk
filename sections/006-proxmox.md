## Proxmox: Build Infra Alongside Home Automation {.section-title}

---

## Why Proxmox in a Home Lab?

- Bare-metal hypervisor — runs VMs and LXC containers
- Home Assistant OS runs great as a Proxmox VM
- Share the same physical machine: HA + build servers + CI agents
- Snapshots: roll back a broken build environment instantly
- Web UI for management without SSH gymnastics

---

## The Stack

<div class="arch-diagram">
  <div class="arch-outer">
    <div class="arch-outer-label">Proxmox Host (x86 mini-PC)</div>
    <div class="arch-services">
      <div class="arch-box">Home Assistant VM<small>HAOS</small></div>
      <div class="arch-box">Build VM<small>Ubuntu / Yocto</small></div>
      <div class="arch-box">CI Agent LXC<small>GitHub Actions runner</small></div>
      <div class="arch-box">NFS / Storage<small>shared sstate cache</small></div>
    </div>
  </div>
</div>

---

## Practical Proxmox Wins

:::: {.slide-columns}
::: {.slide-col-left}
**Build environments:**

- Snapshot before upgrading toolchain
- Clone VM for parallel builds
- Different distros for different SDKs
- Suspend/resume long builds
:::
::: {.slide-col-right}
**Home lab integration:**

- HA automation can start/stop VMs via REST API
- Spin up CI agent only during working hours
- Power metrics: Tasmota on the host machine
- UPS integration: graceful shutdown on power loss
:::
::::
