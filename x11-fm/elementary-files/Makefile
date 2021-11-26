PORTNAME=	files
PORTVERSION=	6.0.4
CATEGORIES=	x11-fm
PKGNAMEPREFIX=	elementary-

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	File browser for the Elementary desktop

LICENSE=	GPLv3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libhandy-1.so:x11-toolkits/libhandy \
		libcanberra.so:audio/libcanberra \
		libnotify.so:devel/libnotify \
		libgit2-glib-1.0.so:devel/libgit2-glib
RUN_DEPENDS=	pkexec:sysutils/polkit \
		xfce4-tumbler>0:deskutils/xfce4-tumbler

USES=		desktop-file-utils elementary gettext gnome meson pkgconfig \
		python:3.6+,build sqlite:3
USE_GNOME=	glib20 gtk30 cairo gdkpixbuf2 pango gvfs
USE_ELEMENTARY=	granite plank

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

MESON_ARGS=	-Dsystemduserunitdir=no \
		-Dwith-zeitgeist=disabled

GLIB_SCHEMAS=	io.elementary.files.gschema.xml

.include <bsd.port.mk>
