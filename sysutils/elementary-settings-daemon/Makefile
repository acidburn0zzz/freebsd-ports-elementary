PORTNAME=	settings-daemon
PORTVERSION=	1.2.0
CATEGORIES=	sysutils
PKGNAMEPREFIX=	elementary-

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Manage settings and background

LICENSE=	GPLv3

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgeoclue-2.so:net/geoclue
RUN_DEPENDS=	accountsservice>0:sysutils/accountsservice \
		elementary-settings>0:sysutils/elementary-settings \
		gnome-session>0:x11/gnome-session

USES=		elementary gettext gnome meson pkgconfig
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	granite

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

MESON_ARGS=	-Dsystemduserunitdir='no'

GLIB_SCHEMAS=	io.elementary.settings-daemon.gschema.xml

.include <bsd.port.mk>
