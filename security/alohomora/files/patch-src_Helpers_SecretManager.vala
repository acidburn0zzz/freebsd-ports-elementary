--- src/Helpers/SecretManager.vala.orig	2020-08-31 07:42:12 UTC
+++ src/Helpers/SecretManager.vala
@@ -190,7 +190,7 @@ public class Alohomora.SecretManager: GLib.Object {
         }
     }
 
-    public List<Secret.Item> get_secrets() {
+    public List<unowned Secret.Item> get_secrets() {
         return secrets.copy();
     }
 
