--- src/Services/IndicatorSorter.vala.orig	2022-01-19 09:20:07 UTC
+++ src/Services/IndicatorSorter.vala
@@ -35,16 +35,13 @@ public class Wingpanel.Services.IndicatorSorter : Obje
         indicator_order[UNKNOWN_INDICATOR] = 1;
         indicator_order[Indicator.ACCESSIBILITY] = 2;
         indicator_order[Indicator.NIGHT_LIGHT] = 3;
-        indicator_order[Indicator.PRIVACY] = 4;
-        indicator_order[Indicator.KEYBOARD] = 5;
-        indicator_order[Indicator.SOUND] = 6;
-        indicator_order[Indicator.NETWORK] = 7;
-        indicator_order[Indicator.BLUETOOTH] = 8;
-        indicator_order[Indicator.PRINTER] = 9;
-        indicator_order[Indicator.SYNC] = 10;
-        indicator_order[Indicator.POWER] = 11;
-        indicator_order[Indicator.MESSAGES] = 12;
-        indicator_order[Indicator.SESSION] = 13;
+        indicator_order[Indicator.KEYBOARD] = 4;
+        indicator_order[Indicator.SOUND] = 5;
+        indicator_order[Indicator.PRINTER] = 6;
+        indicator_order[Indicator.SYNC] = 7;
+        indicator_order[Indicator.POWER] = 8;
+        indicator_order[Indicator.MESSAGES] = 9;
+        indicator_order[Indicator.SESSION] = 10;
     }
 
     public int compare_func (Wingpanel.Widgets.IndicatorEntry? a, Wingpanel.Widgets.IndicatorEntry? b) {
