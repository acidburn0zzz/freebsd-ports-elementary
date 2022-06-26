--- src/Interfaces.vala.orig	2022-05-18 05:01:37 UTC
+++ src/Interfaces.vala
@@ -22,8 +22,6 @@ namespace Power {
     public const string DBUS_UPOWER_PATH = "/org/freedesktop/UPower";
     public const string LOGIND_HELPER_NAME = "io.elementary.logind.helper";
     public const string LOGIND_HELPER_OBJECT_PATH = "/io/elementary/logind/helper";
-    public const string POWER_PROFILES_DAEMON_NAME = "net.hadess.PowerProfiles";
-    public const string POWER_PROFILES_DAEMON_PATH = "/net/hadess/PowerProfiles";
 
     [DBus (name = "org.freedesktop.DBus")]
     public interface DBus : Object {
@@ -64,11 +62,5 @@ namespace Power {
         public abstract bool on_battery { owned get; }
         public abstract bool low_on_battery { owned get; }
         public abstract ObjectPath[] enumerate_devices () throws Error;
-    }
-
-    [DBus (name = "net.hadess.PowerProfiles")]
-    public interface PowerProfile : Object {
-        public abstract HashTable<string, Variant>[] profiles { owned get; }
-        public abstract string active_profile { owned get; set; }
     }
 }
