--- src/Widgets/EndSessionDialog.vala.orig	2020-04-01 23:50:50 UTC
+++ src/Widgets/EndSessionDialog.vala
@@ -29,8 +29,10 @@ public enum Session.Widgets.EndSessionDialogType {
 }
 
 public class Session.Widgets.EndSessionDialog : Gtk.Window {
-    private static LogoutInterface? logout_interface;
-    private static SystemInterface? system_interface;
+    public signal void reboot ();
+    public signal void shutdown ();
+    public signal void logout ();
+    public signal void cancelled ();
 
     public EndSessionDialogType dialog_type { get; construct; }
 
@@ -39,18 +41,6 @@ public class Session.Widgets.EndSessionDialog : Gtk.Wi
     }
 
     construct {
-        var server = EndSessionDialogServer.get_default ();
-
-        try {
-            if (dialog_type == Session.Widgets.EndSessionDialogType.LOGOUT && logout_interface == null) {
-                logout_interface = Bus.get_proxy_sync (BusType.SYSTEM, "org.freedesktop.login1", "/org/freedesktop/login1/user/self");
-            } else if (system_interface == null) {
-                system_interface = Bus.get_proxy_sync (BusType.SYSTEM, "org.freedesktop.login1", "/org/freedesktop/login1");
-            }
-        } catch (GLib.Error e) {
-            critical ("Unable to connect to login1: %s", e.message);
-        }
-
         string icon_name, heading_text, button_text, content_text;
 
         switch (dialog_type) {
@@ -105,14 +95,7 @@ public class Session.Widgets.EndSessionDialog : Gtk.Wi
         if (dialog_type == EndSessionDialogType.RESTART) {
             var confirm_restart = new Gtk.Button.with_label (_("Restart"));
             confirm_restart.clicked.connect (() => {
-                try {
-                    server.confirmed_reboot ();
-                    system_interface.reboot (false);
-                } catch (GLib.Error e) {
-                    warning ("Unable to reboot: %s", e.message);
-                }
-
-                server.closed ();
+                reboot ();
                 destroy ();
             });
 
@@ -151,8 +134,7 @@ public class Session.Widgets.EndSessionDialog : Gtk.Wi
 
         var cancel_action = new SimpleAction ("cancel", null);
         cancel_action.activate.connect (() => {
-            server.canceled ();
-            server.closed ();
+            cancelled ();
             destroy ();
         });
 
@@ -170,22 +152,11 @@ public class Session.Widgets.EndSessionDialog : Gtk.Wi
 
         confirm.clicked.connect (() => {
             if (dialog_type == EndSessionDialogType.RESTART || dialog_type == EndSessionDialogType.SHUTDOWN) {
-                try {
-                    server.confirmed_shutdown ();
-                    system_interface.power_off (false);
-                } catch (GLib.Error e) {
-                    warning ("Unable to shutdown: %s", e.message);
-                }
+                shutdown ();
             } else {
-                try {
-                    server.confirmed_logout ();
-                    logout_interface.terminate ();
-                } catch (GLib.Error e) {
-                    warning ("Unable to logout: %s", e.message);
-                }
+                logout ();
             }
 
-            server.closed ();
             destroy ();
         });
     }
