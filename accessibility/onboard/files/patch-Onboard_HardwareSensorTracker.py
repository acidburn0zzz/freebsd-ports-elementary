--- Onboard/HardwareSensorTracker.py.orig	2017-02-15 08:42:04 UTC
+++ Onboard/HardwareSensorTracker.py
@@ -259,7 +259,7 @@ class AcpidListener:
             elif self._exit_r in rl:
                 break
 
-            for event in data.decode("UTF-8").splitlines():
+            for event in data.decode("UTF-8", errors='replace').splitlines():
 
                 _logger.info("AcpidListener: ACPI event: '{}'"
                              .format(event))
