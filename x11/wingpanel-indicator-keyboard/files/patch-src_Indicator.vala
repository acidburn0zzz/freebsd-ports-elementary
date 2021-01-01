--- src/Indicator.vala.orig	2021-01-01 14:23:57 UTC
+++ src/Indicator.vala
@@ -105,9 +105,6 @@ public class Keyboard.Indicator : Wingpanel.Indicator 
 }
 
 public Wingpanel.Indicator? get_indicator (Module module, Wingpanel.IndicatorManager.ServerType server_type) {
-    // Temporal workarround for Greeter crash
-    if (server_type != Wingpanel.IndicatorManager.ServerType.SESSION)
-        return null;
     debug ("Activating Keyboard Indicator");
     var indicator = new Keyboard.Indicator ();
     return indicator;
