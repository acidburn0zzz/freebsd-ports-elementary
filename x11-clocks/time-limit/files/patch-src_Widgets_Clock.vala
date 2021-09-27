--- src/Widgets/Clock.vala.orig	2021-08-09 12:10:37 UTC
+++ src/Widgets/Clock.vala
@@ -90,7 +90,7 @@ public class Timer.Widgets.Clock : Gtk.Overlay {
         notify["pause"].connect (on_pause_changed);
 
         try {
-            login_manager = GLib.Bus.get_proxy_sync (BusType.SYSTEM, "org.freedesktop.login1", "/org/freedesktop/login1");
+            login_manager = GLib.Bus.get_proxy_sync (BusType.SYSTEM, "org.freedesktop.ConsoleKit", "/org/freedesktop/ConsoleKit/Manager");
             login_manager.prepare_for_sleep.connect ((start) => {
                 if (start) {
                     if (update_labels_timeout_id > 0) {
