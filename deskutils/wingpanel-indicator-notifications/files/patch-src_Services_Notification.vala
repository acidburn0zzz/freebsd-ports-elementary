--- src/Services/Notification.vala.orig	2021-07-16 00:02:35 UTC
+++ src/Services/Notification.vala
@@ -98,7 +98,7 @@ public class Notifications.Notification : Object {
 
             app_info = new DesktopAppInfo (desktop_id);
             if (app_info == null) {
-                app_info = new DesktopAppInfo.from_filename ("/etc/xdg/autostart/%s".printf (desktop_id));
+                app_info = new DesktopAppInfo.from_filename ("%%PREFIX%%/etc/xdg/autostart/%s".printf (desktop_id));
             }
         }
 
