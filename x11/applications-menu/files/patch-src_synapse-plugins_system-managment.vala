--- src/synapse-plugins/system-managment.vala.orig	2021-08-30 17:37:01 UTC
+++ src/synapse-plugins/system-managment.vala
@@ -39,8 +39,8 @@ namespace Synapse {
         public const string UNIQUE_NAME = "org.freedesktop.ConsoleKit";
         public const string OBJECT_PATH = "/org/freedesktop/ConsoleKit/Manager";
 
-        public abstract void restart () throws GLib.Error;
-        public abstract void stop () throws GLib.Error;
+        public abstract async void restart () throws GLib.Error;
+        public abstract async void stop () throws GLib.Error;
         public abstract async bool can_restart () throws GLib.Error;
         public abstract async bool can_stop () throws GLib.Error;
     }
@@ -54,14 +54,6 @@ namespace Synapse {
         public abstract bool get_active () throws GLib.Error;
     }
 
-    [DBus (name = "org.freedesktop.login1.User")]
-    interface LogOutObject : Object {
-        public const string UNIQUE_NAME = "org.freedesktop.login1";
-        public const string OBJECT_PATH = "/org/freedesktop/login1/user/self";
-
-        public abstract void terminate () throws GLib.Error;
-    }
-
     [DBus (name = "org.freedesktop.login1.Manager")]
     public interface SystemdObject : Object {
         public const string UNIQUE_NAME = "org.freedesktop.login1";
@@ -138,39 +130,6 @@ namespace Synapse {
             }
         }
 
-        private class LogOutAction : SystemAction {
-            public LogOutAction () {
-                Object (title: _("Log Out"), match_type: MatchType.ACTION,
-                        description: _("Close all open applications and quit"),
-                        icon_name: "system-log-out", has_thumbnail: false);
-                // ; seperated list of keywords
-                add_keywords (NC_("system_management_action_keyword", "logout"));
-            }
-
-            public override bool action_allowed () {
-                return true;
-            }
-
-            private async void do_log_out () {
-                try {
-                    LogOutObject dbus_interface = Bus.get_proxy_sync (
-                        BusType.SYSTEM,
-                        LogOutObject.UNIQUE_NAME,
-                        LogOutObject.OBJECT_PATH
-                    );
-
-                    dbus_interface.terminate ();
-                    return;
-                } catch (GLib.Error err) {
-                    warning ("%s", err.message);
-                }
-            }
-
-            public override void do_action () {
-                do_log_out.begin ();
-            }
-        }
-
         private class SuspendAction : SystemAction {
             public SuspendAction () {
                 Object (title: _("Suspend"), match_type: MatchType.ACTION,
@@ -396,7 +355,7 @@ namespace Synapse {
                 return allowed;
             }
 
-            public override void do_action () {
+            private async void do_shutdown () {
                 try {
                     SystemdObject dbus_interface = Bus.get_proxy_sync (
                         BusType.SYSTEM,
@@ -417,11 +376,15 @@ namespace Synapse {
                         ConsoleKitObject.OBJECT_PATH
                     );
 
-                    dbus_interface.stop ();
+                    yield dbus_interface.stop ();
                 } catch (GLib.Error err) {
                     warning ("%s", err.message);
                 }
             }
+
+            public override void do_action () {
+                do_shutdown.begin ();
+            }
         }
 
         private class RestartAction : SystemAction {
@@ -472,7 +435,7 @@ namespace Synapse {
                 return allowed;
             }
 
-            public override void do_action () {
+            private async void do_restart () {
                 try {
                     SystemdObject dbus_interface = Bus.get_proxy_sync (
                         BusType.SYSTEM,
@@ -493,11 +456,15 @@ namespace Synapse {
                         ConsoleKitObject.OBJECT_PATH
                     );
 
-                    dbus_interface.restart ();
+                    yield dbus_interface.restart ();
                 } catch (GLib.Error err) {
                     warning ("%s", err.message);
                 }
             }
+
+            public override void do_action () {
+                do_restart.begin ();
+            }
         }
 
         static void register_plugin () {
@@ -522,7 +489,6 @@ namespace Synapse {
         construct {
             actions = new Gee.LinkedList<SystemAction> ();
             actions.add (new LockAction ());
-            actions.add (new LogOutAction ());
             actions.add (new SuspendAction ());
             actions.add (new HibernateAction ());
             actions.add (new ShutdownAction ());
