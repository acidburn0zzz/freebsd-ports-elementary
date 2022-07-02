PORTNAME=	switchboard
PORTVERSION=	6.0.2
CATEGORIES=	sysutils

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Extensible system settings for elementary OS

LICENSE=	GPLv3

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libhandy-1.so:x11-toolkits/libhandy
USES=		desktop-file-utils elementary gettext gnome meson pkgconfig \
		python:3.7+,build
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	granite

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

GLIB_SCHEMAS=	io.elementary.switchboard.gschema.xml

.include <bsd.port.mk>
