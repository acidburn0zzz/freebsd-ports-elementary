--- src/Services/ProcessMonitor/Monitor.vala.orig	2021-08-23 17:38:33 UTC
+++ src/Services/ProcessMonitor/Monitor.vala
@@ -150,7 +150,7 @@ public class Power.Services.ProcessMonitor.Monitor : O
         }
 
         var uid = Posix.getuid ();
-        GTop.ProcList proclist;
+        /*GTop.ProcList proclist;
         var pids = GTop.get_proclist (out proclist, GTop.GLIBTOP_KERN_PROC_UID, uid);
 
         for (int i = 0; i < proclist.number; i++) {
@@ -159,7 +159,7 @@ public class Power.Services.ProcessMonitor.Monitor : O
             if (!process_list.has_key (pid) && !kernel_process_blacklist.contains (pid)) {
                 add_process (pid);
             }
-        }
+        }*/
 
         cpu_last_used = used;
         cpu_last_total = cpu_data.total;
