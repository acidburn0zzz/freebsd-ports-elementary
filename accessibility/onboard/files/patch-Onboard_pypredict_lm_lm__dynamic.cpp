--- Onboard/pypredict/lm/lm_dynamic.cpp.orig	2017-02-15 08:42:04 UTC
+++ Onboard/pypredict/lm/lm_dynamic.cpp
@@ -17,8 +17,8 @@
  * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <error.h>
 
+
 #include "lm_dynamic.h"
 
 using namespace std;
@@ -91,7 +91,7 @@ LMError DynamicModelBase::load_arpac(const char* filen
                     int ngrams_read = get_num_ngrams(current_level-1);
                     if (ngrams_read != ngrams_expected)
                     {
-                        error (0, 0, "unexpected n-gram count for level %d: "
+                        fprintf (stderr, "unexpected n-gram count for level %d: "
                                      "expected %d n-grams, but read %d",
                               current_level,
                               ngrams_expected, ngrams_read);
@@ -105,7 +105,7 @@ LMError DynamicModelBase::load_arpac(const char* filen
                     if (ntoks < current_level+1)
                     {
                         err_code = ERR_NUMTOKENS; // too few tokens for cur. level
-                        error (0, 0, "too few tokens for n-gram level %d: "
+                        fprintf (stderr, "too few tokens for n-gram level %d: "
                               "line %d, tokens found %d/%d",
                               current_level,
                               line_number, ntoks, current_level+1);
