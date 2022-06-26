--- cli/Server.vala.orig	2022-05-18 05:01:37 UTC
+++ cli/Server.vala
@@ -29,7 +29,7 @@ public class LoginDHelper.Server : Object {
      */
     public signal void changed ();
 
-    private const string CONFIG_FILE = "/etc/systemd/logind.conf";
+    private const string CONFIG_FILE = "%%PREFIX%%/etc/systemd/logind.conf";
     private const string CONFIG_GROUP = "Login";
     private const string ACTION_ID = "io.elementary.switchboard.power.administration";
 
