PORTNAME=	shortcut-overlay
PORTVERSION=	2.0.0
CATEGORIES=	deskutils

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Keyboard shortcuts applet

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libhandy-1.so:x11-toolkits/libhandy

USES=	elementary gettext gnome meson pkgconfig
USE_GNOME=	glib20 gtk40
USE_ELEMENTARY=	granite7

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

.include <bsd.port.mk>
