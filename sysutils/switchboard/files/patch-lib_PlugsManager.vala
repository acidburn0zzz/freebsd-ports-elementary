--- lib/PlugsManager.vala.orig	2020-04-30 20:47:16 UTC
+++ lib/PlugsManager.vala
@@ -45,7 +45,7 @@ public class Switchboard.PlugsManager : GLib.Object {
             error ("Switchboard is not supported by this system!");
         }
 
-        Module module = Module.open (path, ModuleFlags.BIND_LAZY);
+        Module module = Module.open (path, ModuleFlags.LAZY);
         if (module == null) {
             critical (Module.error ());
             return;
