#!/bin/sh

#export LC_CTYPE="fr_FR.UTF-8"
#export LANG="fr_FR.UTF-8"

# Set $XDG_SESSION_TYPE
if test "x$XDG_SESSION_TYPE" = "x"; then
	XDG_SESSION_TYPE="x11"
fi
export XDG_SESSION_TYPE

# Set $GDK_BACKEND
if test "x$GDK_BACKEND" = "x"; then
	GDK_BACKEND="x11"
fi
export GDK_BACKEND

# Set $XDG_MENU_PREFIX
if test "x$XDG_MENU_PREFIX" = "x" ; then
	XDG_MENU_PREFIX="pantheon-"
fi
export XDG_MENU_PREFIX

# Set $XDG_CURRENT_DESKTOP
if test "x$XDG_CURRENT_DESKTOP" = "x" ; then
	XDG_CURRENT_DESKTOP="Pantheon"
fi
export XDG_CURRENT_DESKTOP

# Set $XDG_CONFIG_DIRS
if test "x$XDG_CONFIG_DIRS" = "x" ; then
	XDG_CONFIG_DIRS="/etc/xdg:/usr/local/etc/xdg"
fi
export XDG_CONFIG_DIRS

# Set $XDG_DATA_DIRS
if test "x$XDG_DATA_DIRS" = "x" ; then
	XDG_DATA_DIRS="/usr/local/share:/usr/share"
fi
export XDG_DATA_DIRS

# $XDG_CONFIG_HOME defines the base directory relative to which user specific
# configuration files should be stored. If $XDG_CONFIG_HOME is either not set
# or empty, a default equal to $HOME/.config should be used.
if test "x$XDG_CONFIG_HOME" = "x" ; then
	XDG_CONFIG_HOME=$HOME/.config
fi
[ -d "$XDG_CONFIG_HOME" ] || mkdir "$XDG_CONFIG_HOME"

# $XDG_CACHE_HOME defines the base directory relative to which user specific
# non-essential data files should be stored. If $XDG_CACHE_HOME is either not
# set or empty, a default equal to $HOME/.cache should be used.
if test "x$XDG_CACHE_HOME" = "x" ; then
	XDG_CACHE_HOME=$HOME/.cache
fi
[ -d "$XDG_CACHE_HOME" ] || mkdir "$XDG_CACHE_HOME"

# Set up XDG user directores. See
# https://freedesktop.org/wiki/Software/xdg-user-dirs
if command -v xdg-user-dirs-update >/dev/null 2>&1 ; then
	xdg-user-dirs-update
fi

# For now, start with an empty list
XRESOURCES=""

test -r $HOME/.Xdefaults && XRESOURCES="$XRESOURCES $HOME/.Xdefaults"

# ~/.Xresources contains overrides to the above
test -r "$HOME/.Xresources" && XRESOURCES="$XRESOURCES $HOME/.Xresources"

# Load all X resources (adds /dev/null to avoid an empty list that would hang the process)
cat /dev/null $XRESOURCES | xrdb -merge -

# Load local modmap
test -r $HOME/.Xmodmap && xmodmap $HOME/.Xmodmap

plank &
# This is only required for starting from a console, or not login
# manager
if command -v ck-launch-session >/dev/null 2>&1; then
	exec ck-launch-session gnome-session --builtin --session=pantheon
else
	exec gnome-session --builtin --session=pantheon
fi
