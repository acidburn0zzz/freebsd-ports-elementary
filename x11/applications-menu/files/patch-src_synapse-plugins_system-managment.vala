--- src/synapse-plugins/system-managment.vala.orig	2019-11-25 17:07:00 UTC
+++ src/synapse-plugins/system-managment.vala
@@ -54,18 +54,11 @@ namespace Synapse {
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
-    [DBus (name = "org.freedesktop.login1.Manager")]
+    /* ConsoleKit2 emulates these methods too, as logind */
+    [DBus (name = "org.freedesktop.ConsoleKit.Manager")]
     public interface SystemdObject : Object {
-        public const string UNIQUE_NAME = "org.freedesktop.login1";
-        public const string OBJECT_PATH = "/org/freedesktop/login1";
+        public const string UNIQUE_NAME = "org.freedesktop.ConsoleKit";
+        public const string OBJECT_PATH = "/org/freedesktop/ConsoleKit/Manager";
 
         public abstract void reboot (bool interactive) throws GLib.Error;
         public abstract void suspend (bool interactive) throws GLib.Error;
@@ -138,39 +131,6 @@ namespace Synapse {
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
@@ -522,7 +482,6 @@ namespace Synapse {
         construct {
             actions = new Gee.LinkedList<SystemAction> ();
             actions.add (new LockAction ());
-            actions.add (new LogOutAction ());
             actions.add (new SuspendAction ());
             actions.add (new HibernateAction ());
             actions.add (new ShutdownAction ());
