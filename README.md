# Arch Linux custom i8kutils

This is a customized version of [i8kutils](https://launchpad.net/i8kutils)
that takes care of disabling automatic BIOS fan control before
starting the i8kmon daemon, using [dell-bios-fan-control](https://github.com/TomFreudenberg/dell-bios-fan-control), and re-enable when the daemon is stopped.

It also adds a script that automatically restarts the daemon after resuming
from suspend to deal with a [bug](https://askubuntu.com/questions/715520/i8kutils-i8kmon-uses-wrong-thresholds-after-resuming-from-suspend)
where i8kmon gets stuck in a fixed state after resuming from suspend.

## Installation

Use `makepkg` to build the packages in the given folders, and install them using `pacman -U`. Packages needs to be installed in the following order:

- dell-bios-fan-control
- i8kutils (depends on the previous one)

## Enable the daemon

Enable the systemd service:

```
$ sudo systemctl enable --now i8kmon.service
```
