--- meson/create-symlink.sh.orig	2021-08-31 19:15:18 UTC
+++ meson/create-symlink.sh
@@ -6,7 +6,5 @@ set -eu
 
 mkdir -vp "$(dirname "${DESTDIR:-}$2")"
 if [ "$(dirname $1)" = . -o "$(dirname $1)" = .. ]; then
-    ln -vfs -T -- "$1" "${DESTDIR:-}$2"
-else
-    ln -vfs -T --relative -- "${DESTDIR:-}$1" "${DESTDIR:-}$2"
+    ln -vfs "$1" "${DESTDIR:-}$2"
 fi
