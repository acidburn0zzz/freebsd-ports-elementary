# FreeBSD elementary OS development repo

This is the [FreeBSD Ports](https://cgit.freebsd.org/ports/) collection in order to run this desktop.

Repository contains several branches:

* [3rd-party-apps](https://codeberg.org/olivierd/freebsd-ports-elementary/src/branch/3rd-party-apps) → curated list of applications, which use the Granite toolkit
* [6.1](https://codeberg.org/olivierd/freebsd-ports-elementary/src/branch/6.1) → **main branch**
* obsolete → no need anymore

For complete documentation, see [wiki](wiki).

## Screenshots

[![Pantheeon desktop](https://codeberg.org/olivierd/freebsd-ports-elementary/raw/branch/master/img/pantheon-desktop_55.png)](https://codeberg.org/olivierd/freebsd-ports-elementary/raw/branch/master/img/pantheon-desktop.png)

[![Greeter screenshot](https://codeberg.org/olivierd/freebsd-ports-elementary/raw/branch/master/img/io.elementary.greeter_55.png)](https://codeberg.org/olivierd/freebsd-ports-elementary/raw/branch/master/img/io.elementary.greeter.png)

## Tips

### Turn numlock on

Even if numlock is enabled with your login manager. When session is opened, this feature is disabled. To change this:

```
% gsettings set io.elementary.wingpanel.keyboard numlock true
```

The best way is to create a [dconf profile](https://help.gnome.org/admin//system-admin-guide/3.8/dconf-custom-defaults.html.en) → [mine](https://codeberg.org/olivierd/freebsd-ports-elementary/src/branch/master/dconf/).

### Theme for GTK 4 applications

By default GTK 4 theme settings is missing. To fix this:

```
% mkdir -p ~/.config/gtk-4.0
% fetch https://codeberg.org/olivierd/freebsd-ports-elementary/raw/branch/master/gtk-4.0_settings.ini \
  -o ~/.config/gtk-4.0/settings.ini
```
