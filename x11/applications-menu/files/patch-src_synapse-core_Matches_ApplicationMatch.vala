--- src/synapse-core/Matches/ApplicationMatch.vala.orig	2019-11-25 17:07:00 UTC
+++ src/synapse-core/Matches/ApplicationMatch.vala
@@ -23,6 +23,5 @@
 
 public interface Synapse.ApplicationMatch: Synapse.Match {
     public abstract AppInfo? app_info { get; set; }
-    public abstract bool needs_terminal { get; set; }
     public abstract string? filename { get; construct set; }
 }
