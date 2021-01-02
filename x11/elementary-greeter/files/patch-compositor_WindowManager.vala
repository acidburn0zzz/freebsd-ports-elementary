--- compositor/WindowManager.vala.orig	2020-04-05 17:48:45 UTC
+++ compositor/WindowManager.vala
@@ -22,8 +22,8 @@ namespace GreeterCompositor {
 
     public class WindowManager : Meta.Plugin {
         const uint GL_VENDOR = 0x1F00;
-        const string LOGIND_DBUS_NAME = "org.freedesktop.login1";
-        const string LOGIND_DBUS_OBJECT_PATH = "/org/freedesktop/login1";
+        const string LOGIND_DBUS_NAME = "org.freedesktop.ConsoleKit";
+        const string LOGIND_DBUS_OBJECT_PATH = "/org/freedesktop/ConsoleKit";
 
         delegate unowned string? GlQueryFunc (uint id);
 
