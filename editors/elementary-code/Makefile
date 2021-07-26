PORTNAME=	elementary-code
DISTVERSION=	6.0.0
CATEGORIES=	editors

MAINTAINER=	miguel@gocobachi.dev
COMMENT=	Code editor designed for elementary OS

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
# Core dependencies
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libgranite.so:x11-toolkits/granite \
		libhandy-1.so:x11-toolkits/libhandy \
		libpeas-1.0.so:devel/libpeas \
		libfontconfig.so:x11-fonts/fontconfig \
		libgit2-glib-1.0.so:devel/libgit2-glib
# For plugins
LIB_DEPENDS+=	libeditorconfig.so:editors/editorconfig-core-c \
		libgtkspell3-3.so:textproc/gtkspell3 \
		libsoup-2.4.so:devel/libsoup
RUN_DEPENDS=	droid-fonts-ttf>0:x11-fonts/droid-fonts-ttf \
		pkcheck:sysutils/polkit

USES=		compiler:c++11-lang desktop-file-utils gettext gnome meson \
		pkgconfig python:3.6+,build
USE_GITHUB=	yes
GH_ACCOUNT=	elementary
GH_PROJECT=	code
USE_GNOME=	cairo glib20 gtk30 gtksourceview4 pango vte3
GLIB_SCHEMAS=	io.elementary.code.gschema.xml \
		io.elementary.code.plugins.spell.gschema.xml \
		io.elementary.code.plugins.terminal.gschema.xml
INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes

BINARY_ALIAS=	python3=${PYTHON_CMD}

do-test:
	cd ${WRKSRC}/${MESON_BUILD_DIR} && ninja test

.include <bsd.port.mk>
