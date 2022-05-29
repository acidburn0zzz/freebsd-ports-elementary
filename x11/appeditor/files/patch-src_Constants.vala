--- src/Constants.vala.orig	2021-12-24 01:52:18 UTC
+++ src/Constants.vala
@@ -17,7 +17,7 @@
 
 namespace AppEditor.Constants {
     public const string APP_NAME = _("AppEditor");
-    public const string VERSION = "0.9.3";
+    public const string VERSION = "%%PORTVERSION%%";
     public const string SETTINGS_SCHEMA = "com.github.donadigo.appeditor";
     public const string EXEC_NAME = "com.github.donadigo.appeditor";
     public const string DESKTOP_NAME = "com.github.donadigo.appeditor.desktop";
