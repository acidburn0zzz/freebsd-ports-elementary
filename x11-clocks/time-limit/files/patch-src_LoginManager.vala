--- src/LoginManager.vala.orig	2021-08-09 12:10:37 UTC
+++ src/LoginManager.vala
@@ -19,7 +19,7 @@
 * Authored by: Marco Betschart <time-limit@marco.betschart.name
 */
 
-[DBus (name = "org.freedesktop.login1.Manager")]
+[DBus (name = "org.freedesktop.ConsoleKit.Manager")]
 interface LoginManager : GLib.Object {
     public signal void prepare_for_sleep (bool start);
 }
