--- src/Gestures/ToucheggBackend.vala.orig	2021-09-29 17:20:47 UTC
+++ src/Gestures/ToucheggBackend.vala
@@ -47,7 +47,7 @@ public class Gala.ToucheggBackend : Object {
     /**
      * Daemon D-Bus address.
      */
-    private const string DBUS_ADDRESS = "unix:abstract=touchegg";
+    private const string DBUS_ADDRESS = "unix:path=touchegg";
 
     /**
      * D-Bus interface name.
@@ -69,7 +69,7 @@ public class Gala.ToucheggBackend : Object {
     /**
      * Maximum number of reconnection attempts to the daemon.
      */
-    private const int MAX_RECONNECTION_ATTEMPTS = 10;
+    private const int MAX_RECONNECTION_ATTEMPTS = 2;
 
     /**
      * Time to sleep between reconnection attempts.
