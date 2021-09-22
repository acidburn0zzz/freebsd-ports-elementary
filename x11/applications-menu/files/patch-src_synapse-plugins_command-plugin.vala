--- src/synapse-plugins/command-plugin.vala.orig	2021-08-30 17:37:01 UTC
+++ src/synapse-plugins/command-plugin.vala
@@ -38,8 +38,7 @@ namespace Synapse {
             public CommandObject (string cmd) {
                 Object (title: _("Execute '%s'").printf (cmd), description: _("Run command"), command: cmd,
                         icon_name: "application-x-executable",
-                        match_type: MatchType.APPLICATION,
-                        needs_terminal: cmd.has_prefix ("sudo "));
+                        match_type: MatchType.APPLICATION);
 
                 try {
                     app_info = AppInfo.create_from_commandline (
@@ -49,6 +48,11 @@ namespace Synapse {
                     );
                 } catch (Error err) {
                     warning ("%s", err.message);
+                }
+
+                // We have security/sudo and security/doas
+                if ((cmd.contains ("sudo ")) || (cmd.contains ("doas "))) {
+                    needs_terminal = true;
                 }
             }
         }
