#!/bin/sh

#export LC_CTYPE="fr_FR.UTF-8"
#export LANG="fr_FR.UTF-8"

# Probably bad idea
rm $HOME/*.core

[ -f $HOME/.xprofile ] && . $HOME/.xprofile

/usr/local/libexec/gvfsd-trash &
[ -e "$XDG_CONFIG_HOME/autostart/plank.desktop" ] || plank &
exec /usr/local/bin/ck-launch-session /usr/local/bin/gnome-session --builtin --session=pantheon
