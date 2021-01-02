--- src/Indicator.vala.orig	2020-06-30 19:54:39 UTC
+++ src/Indicator.vala
@@ -28,9 +28,7 @@ public class DateTime.Indicator : Wingpanel.Indicator 
 
     public Indicator () {
         Object (
-            code_name: Wingpanel.Indicator.DATETIME,
-            display_name: _("Date & Time"),
-            description: _("The date and time indicator")
+            code_name: Wingpanel.Indicator.DATETIME
         );
     }
 
@@ -225,8 +223,14 @@ public class DateTime.Indicator : Wingpanel.Indicator 
     }
 }
 
-public Wingpanel.Indicator get_indicator (Module module) {
+public Wingpanel.Indicator? get_indicator (Module module, Wingpanel.IndicatorManager.ServerType server_type) {
     debug ("Activating DateTime Indicator");
+
+    if (server_type != Wingpanel.IndicatorManager.ServerType.SESSION) {
+        debug ("Wingpanel is not in session, not loading DateTime");
+        return null;
+    }
+
     var indicator = new DateTime.Indicator ();
 
     return indicator;
