--- Onboard/Indicator.py.orig	2017-02-15 08:42:04 UTC
+++ Onboard/Indicator.py
@@ -133,7 +133,7 @@ class ContextMenu(GObject.GObject):
         self._keyboard.request_visibility_toggle()
 
     def _on_help(self, data=None):
-        subprocess.Popen(["/usr/bin/yelp", "help:onboard"])
+        subprocess.Popen(["%%PREFIX%%/bin/yelp", "help:onboard"])
 
     def _on_quit(self, data=None):
         _logger.debug("Entered _on_quit")
