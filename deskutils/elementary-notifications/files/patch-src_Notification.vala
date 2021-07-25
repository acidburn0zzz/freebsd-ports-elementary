--- src/Notification.vala.orig	2021-07-19 16:46:35 UTC
+++ src/Notification.vala
@@ -72,7 +72,7 @@ public class Notifications.Notification : GLib.Object 
 
             app_info = new DesktopAppInfo ("%s.desktop".printf (app_id));
             if (app_info == null) {
-                app_info = new DesktopAppInfo.from_filename ("/etc/xdg/autostart/%s.desktop".printf (app_id));
+                app_info = new DesktopAppInfo.from_filename ("%%PREFIX%%/etc/xdg/autostart/%s.desktop".printf (app_id));
             }
         }
 
