--- src/Backend/SynapseSearch.vala.orig	2021-08-30 17:37:01 UTC
+++ src/Backend/SynapseSearch.vala
@@ -26,8 +26,7 @@ namespace Slingshot.Backend {
             typeof (Synapse.DesktopFilePlugin),
             typeof (Synapse.SwitchboardPlugin),
             typeof (Synapse.SystemManagementPlugin),
-            typeof (Synapse.LinkPlugin),
-            typeof (Synapse.AppcenterPlugin)
+            typeof (Synapse.LinkPlugin)
         };
 
         private static Synapse.DataSink? sink = null;
