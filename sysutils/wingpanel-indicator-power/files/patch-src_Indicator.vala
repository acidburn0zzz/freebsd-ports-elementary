--- src/Indicator.vala.orig	2021-08-23 17:38:33 UTC
+++ src/Indicator.vala
@@ -142,7 +142,7 @@ public class Power.Indicator : Wingpanel.Indicator {
     }
 
     public override void opened () {
-        Services.ProcessMonitor.Monitor.get_default ().update ();
+
     }
 
     public override void closed () {
