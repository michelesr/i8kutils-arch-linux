# Arch Linux custom i8kutils

This is a customized version of [i8kutils](https://launchpad.net/i8kutils) that
takes care of disabling automatic BIOS fan control before starting the i8kmon
daemon, using
[dell-bios-fan-control](https://github.com/TomFreudenberg/dell-bios-fan-control),
and re-enabling the BIOS control when the daemon is stopped.

It also adds a script that automatically restarts the daemon after resuming
from suspend to deal with a
[bug](https://askubuntu.com/questions/715520/i8kutils-i8kmon-uses-wrong-thresholds-after-resuming-from-suspend)
where i8kmon gets stuck in a fixed state after resuming from suspend.

## Installation

Use `makepkg` to build the packages in the given folders, and install them
using `pacman -U`. Packages need to be installed in the following order:

- dell-bios-fan-control
- i8kutils (depends on the previous one)

To enable and start the thermal daemon:

```
$ sudo systemctl enable --now i8kmon.service
```

### i8k module

The i8kmon thermal daemon relies on the `i8k` module, so make sure it's loaded properly. To load it at boot:

```
$ sudo tee /etc/modules-load.d/i8k.conf <<<i8k
```

On some machines (like Dell XPS 15 9570) you need to set the option to force the loading of the module (apparentely is not supported):

```
$ sudo tee /etc/modprobe.d/i8k.conf <<<"options i8k force=1"
```
