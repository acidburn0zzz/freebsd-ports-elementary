--- src/synapse-core/Actions/RunnerAction.vala.orig	2019-11-25 17:07:00 UTC
+++ src/synapse-core/Actions/RunnerAction.vala
@@ -58,7 +58,7 @@ private class Synapse.RunnerAction: Synapse.BaseAction
                 return true;
             case MatchType.APPLICATION:
                 unowned ApplicationMatch? am = match as ApplicationMatch;
-                return am == null || !am.needs_terminal;
+                return am == null;
             default:
                 return false;
         }
