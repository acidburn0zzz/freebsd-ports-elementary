# FreeBSD elementary OS development repo

This is the [FreeBSD Ports](https://cgit.freebsd.org/ports/) collection in order to make this desktop environment usable. *Keep in mind, desktop can crash at anytime.*

**/!\ Running the Pantheon desktop requires at least 13.1-RELEASE or higher (some components depend of `deskutils/xdg-desktop-portal`).**

Repository contains several branches:

* [3rd-party-apps](https://codeberg.org/olivierd/freebsd-ports-elementary/src/branch/3rd-party-apps) → curated list of applications, which use the Granite toolkit
* [6.1](https://codeberg.org/olivierd/freebsd-ports-elementary/src/branch/6.1) → **main branch**
* obsolete → no need anymore

## How to test

1. `pkg install git`
2. fetch [elementary-merge](https://codeberg.org/olivierd/freebsd-ports-elementary/raw/branch/master/Tools/scripts/elementary-merge) script

You need to adjust **LOCAL_REP** variable, before to run it. The ports collection must be present in your system. Then run `sh elementary-merge -h` for more details.

3. Install `x11-wm/elementary-session`

```
# cd /usr/ports/x11-wm/elementary-session
# make install clean
```

### How to setup

Currently `io.elementary.greeter` (greeter for LightDM) fails to load pantheon session. But it is possible to have full session from a console or with `x11/lightdm-gtk-greeter`.

1. Enable the gnome-keyring daemon (**it is mandatory**), follow instructions → `pkg info -D elementary-greeter`
2. Create `.xinitrc` (or adjust our own). `x11-wm/elementary-session` provides 2 skeletons for **xinitrc** and **xprofile** → `pkg info -D elementary-session`

Such files are needed, because Gala (the window manager) loads several environment variables.

```
% cp /usr/local/share/examples/elementary-session/xinitrc ~/.xinitrc
% cp /usr/local/share/examples/elementary-session/xprofile ~/.xprofile
```

3. Launch Plank automatically

```
% mkdir -p ~/.config/autostart
% cp /usr/local/share/examples/elementary-session/plank.desktop ~/.config/autostart/
```

4. Enjoy!

## Screenshots

[![Pantheeon desktop](https://codeberg.org/olivierd/freebsd-ports-elementary/raw/branch/master/img/pantheon-desktop_55.png)](https://codeberg.org/olivierd/freebsd-ports-elementary/raw/branch/master/img/pantheon-desktop.png)

[![Greeter screenshot](https://codeberg.org/olivierd/freebsd-ports-elementary/raw/branch/master/img/io.elementary.greeter_55.png)](https://codeberg.org/olivierd/freebsd-ports-elementary/raw/branch/master/img/io.elementary.greeter.png)

## Tips

### Theme for GTK 4 applications

By default GTK 4 theme settings is missing. To fix this:

```
% mkdir -p ~/.config/gtk-4.0
% fetch https://codeberg.org/olivierd/freebsd-ports-elementary/raw/branch/master/gtk-4.0_settings.ini \
  -o ~/.config/gtk-4.0/settings.ini
```

### Turn numlock on

Even if numlock is enabled with your login manager. When session is opened, this feature is disabled. To change this:

```
% gsettings set io.elementary.wingpanel.keyboard numlock true
```

To see others properties:

```
% gsettings list-recursively io.elementary.wingpanel.keyboard
```

### Webcam setup

1. Install webcamd
2. Load **cuse.ko** kernel module, and edit `/etc/rc.conf`
3. Add yourself to the **webcamd** group
4. Start **webcamd(8)** demon

```
# pkg install webcamd
# kldload cuse
# sysrc kld_list+=cuse
# pw groupmod webcamd -m olivierd

# vi /etc/rc.conf → webcamd_enable="YES"

# service webcamd start
```

5. Check available cameras

```
% usbconfig
.
.
.
ugen2.3: <NC2141102N70206E30LM21 VGA Webcam> at usbus2, cfg=0 md=HOST spd=HIGH (480Mbps) pwr=ON (500mA)
```

The USB device of my webcam is **ugen2.3**, we can adjust value of `webcamd_0_flags`.

	# vi /etc/rc.conf → webcamd_0_flags="-d ugen2.3"

Now we can test, if everything is fine. Install gstreamer1-plugings-v4l2.

	# pkg install gstreamer1-plugins-v4l2 gstreamer1-plugins-ximagesrc

	% GST_V4L2_USE_LIBV4L2=1 gst-launch-1.0 v4l2src ! xvimagesink

Or `cd multimedia/elementary-camera ; make install clean`

![Screenshot of io.elementary.camera](https://codeberg.org/olivierd/freebsd-ports-elementary/raw/branch/master/img/io.elementary.camera.png)
