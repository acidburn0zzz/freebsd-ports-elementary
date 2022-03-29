--- src/Main.vala.orig	2021-11-23 20:22:23 UTC
+++ src/Main.vala
@@ -47,7 +47,7 @@ namespace Gala {
         Posix.sigset_t empty_mask;
         Posix.sigemptyset (out empty_mask);
         Posix.sigaction_t act = {};
-        act.sa_handler = Posix.SIG_IGN;
+        //act.sa_handler = Posix.SIG_IGN;
         act.sa_mask = empty_mask;
         act.sa_flags = 0;
 
