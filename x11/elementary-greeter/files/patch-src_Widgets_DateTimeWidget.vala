--- src/Widgets/DateTimeWidget.vala.orig	2021-07-14 19:41:27 UTC
+++ src/Widgets/DateTimeWidget.vala
@@ -1,4 +1,4 @@
-[DBus (name = "org.freedesktop.login1.Manager")]
+[DBus (name = "org.freedesktop.ConsoleKit.Manager")]
 interface LoginManager : GLib.Object {
     public signal void prepare_for_sleep (bool start);
 }
@@ -49,8 +49,8 @@ public class Greeter.DateTimeWidget : Gtk.Grid {
         try {
             login_manager = yield Bus.get_proxy (
                 BusType.SYSTEM,
-                "org.freedesktop.login1",
-                "/org/freedesktop/login1"
+                "org.freedesktop.ConsoleKit.Manager",
+                "/org/freedesktop/ConsoleKit/Manager"
             );
 
             login_manager.prepare_for_sleep.connect ((start) => {
