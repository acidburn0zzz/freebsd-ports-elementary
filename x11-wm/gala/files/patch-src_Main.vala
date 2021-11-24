--- src/Main.vala.orig	2021-11-23 20:22:23 UTC
+++ src/Main.vala
@@ -44,7 +44,7 @@ namespace Gala {
 
         /* Intercept signals */
         ctx.set_plugin_gtype (typeof (WindowManagerGala));
-        Posix.sigset_t empty_mask;
+        /*Posix.sigset_t empty_mask;
         Posix.sigemptyset (out empty_mask);
         Posix.sigaction_t act = {};
         act.sa_handler = Posix.SIG_IGN;
@@ -57,7 +57,7 @@ namespace Gala {
 
         if (Posix.sigaction (Posix.SIGXFSZ, act, null) < 0) {
             warning ("Failed to register SIGXFSZ handler: %s", GLib.strerror (GLib.errno));
-        }
+        }*/
 
         GLib.Unix.signal_add (Posix.SIGTERM, () => {
             ctx.terminate ();
