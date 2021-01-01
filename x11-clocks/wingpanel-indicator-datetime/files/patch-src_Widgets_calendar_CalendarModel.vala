--- src/Widgets/calendar/CalendarModel.vala.orig	2020-03-29 19:40:47 UTC
+++ src/Widgets/calendar/CalendarModel.vala
@@ -65,7 +65,7 @@ namespace DateTime.Widgets {
             source_events = new HashTable<E.Source, Gee.TreeMultiMap<string, ECal.Component> > (Util.source_hash_func, Util.source_equal_func);
             source_view = new HashTable<string, ECal.ClientView> (str_hash, str_equal);
 
-            int week_start = Posix.NLTime.FIRST_WEEKDAY.to_string ().data[0];
+            int week_start = Posix.NLItem.DAY_1.to_string ().data[0];
             if (week_start >= 1 && week_start <= 7) {
                 week_starts_on = (GLib.DateWeekday) (week_start - 1);
             }
