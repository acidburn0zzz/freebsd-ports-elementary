--- Onboard/Config.py.orig	2017-02-16 20:42:29 UTC
+++ Onboard/Config.py
@@ -101,8 +101,8 @@ DEFAULT_COLOR_SCHEME       = "Classic Onboard"
 
 START_ONBOARD_XEMBED_COMMAND = "onboard --xid"
 
-INSTALL_DIR                = "/usr/share/onboard"
-LOCAL_INSTALL_DIR          = "/usr/local/share/onboard"
+INSTALL_DIR                = "%%PREFIX%%/share/onboard"
+LOCAL_INSTALL_DIR          = "%%PREFIX%%/share/onboard"
 USER_DIR                   = "onboard"
 
 SYSTEM_DEFAULTS_FILENAME   = "onboard-defaults.conf"
