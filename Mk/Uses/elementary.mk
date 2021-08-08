# Provide support for the Elementary related ports
#
# Feature:      elementary
# Usage:        USES= elementary
# Valid ARGS:   does not require args
#
# Variable which can be set by the port:
# USE_ELEMENTARY  List of components
#
# MAINTAINER: portmgr@FreeBSD.org

.if !defined(_INCLUDE_USES_ELEMENTARY_MK)
_INCLUDE_USES_ELEMENTARY_MK=  yes

.if !empty(elementary_ARGS)
IGNORE= Incorrect USES+= elementary:${elementary_ARGS} takes no arguments
.endif

DIST_SUBDIR=	elementary

PLIST_SUB+=	SWITCHBOARD_PLUGDIR="lib/switchboard" \
		WINGPANEL_PLUGDIR="lib/wingpanel"

# Available Elementary components are:
_USE_ELEMENTARY_ALL=  gala granite plank switchboard wingpanel

gala_LIB_DEPENDS=       libgala.so:x11-wm/gala
gala_RUN_DEPENDS=       gala:x11-wm/gala
gala_USE_ELEMENTARY_REQ=  granite plank

granite_LIB_DEPENDS=    libgranite.so:x11-toolkits/granite

plank_LIB_DEPENDS=  libplank.so:x11/plank
plank_RUN_DEPENDS=  plank:x11/plank

switchboard_LIB_DEPENDS=	libswitchboard-2.0.so:sysutils/switchboard
switchboard_USE_ELEMENTARY_REQ=	granite

wingpanel_LIB_DEPENDS=	libwingpanel.so:x11/wingpanel
wingpanel_RUN_DEPENDS=	io.elementary.wingpanel:x11/wingpanel
wingpanel_USE_ELEMENTARY_REQ=	gala

.if defined(USE_ELEMENTARY)

# First, expand all USE_ELEMENTARY_REQ recursively.
.for comp in ${_USE_ELEMENTARY_ALL}
. for subcomp in ${${comp}_USE_ELEMENTARY_REQ}
${comp}_USE_ELEMENTARY_REQ+=  ${${subcomp}_USE_ELEMENTARY_REQ}
. endfor
.endfor

# Then, use already expanded USE_ELEMENTARY_REQ to expand USE_ELEMENTARY.
.for comp in ${USE_ELEMENTARY}
. if empty(_USE_ELEMENTARY_ALL:M${comp})
IGNORE= cannot install: Unknown component ${comp}
. else
_USE_ELEMENTARY+= ${${comp}_USE_ELEMENTARY_REQ} ${comp}
. endif
.endfor

# Remove duplicate components
USE_ELEMENTARY=   ${_USE_ELEMENTARY:O:u}

.for comp in ${USE_ELEMENTARY}
. if defined(${comp}_BUILD_DEPENDS)
BUILD_DEPENDS+= ${${comp}_BUILD_DEPENDS}
. endif

. if defined(${comp}_LIB_DEPENDS)
LIB_DEPENDS+= ${${comp}_LIB_DEPENDS}
. endif

. if defined(${comp}_RUN_DEPENDS)
RUN_DEPENDS+= ${${comp}_RUN_DEPENDS}
. endif
.endfor

.endif # end of defined(USE_ELEMENTARY)

.endif # end of !defined(_INCLUDE_USES_ELEMENTARY_MK)

.if defined(_POSTMKINCLUDED) && !defined(_INCLUDE_USES_ELEMENTARY_POST_MK)
_INCLUDE_USES_ELEMENTARY_POST_MK= yes
.endif
