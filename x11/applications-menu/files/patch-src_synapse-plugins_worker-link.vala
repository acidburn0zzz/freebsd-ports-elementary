--- src/synapse-plugins/worker-link.vala.orig	2021-08-30 17:37:01 UTC
+++ src/synapse-plugins/worker-link.vala
@@ -25,16 +25,8 @@ public class Synapse.WorkerLink : GLib.Object {
     public signal void on_connection_accepted (GLib.DBusConnection connection);
 
     construct {
-        if (GLib.UnixSocketAddress.abstract_names_supported ()) {
-            address = "unix:abstract=/tmp/dbus-applications-menu-%u".printf ((uint)Posix.getpid ());
-        } else {
-            try {
-                var tmpdir = GLib.DirUtils.make_tmp ("dbus-applications-menu-XXXXXX");
-                address = "unix:tmpdir=%s".printf (tmpdir);
-            } catch (Error e) {
-                error ("Failed to determine temporary directory for D-Bus: %s", e.message);
-            }
-        }
+        // 'abstract' and 'tmpdir' keys are only on Linux
+        address = "unix:path=/tmp/dbus-applications-menu-%u".printf ((uint) Posix.getpid ());
 
         var guid = GLib.DBus.generate_guid ();
         auth_observer = new GLib.DBusAuthObserver ();
