PORTNAME=	shortcut-overlay
PORTVERSION=	1.2.1
CATEGORIES=	deskutils

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Keyboard shortcuts applet

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libhandy-1.so:x11-toolkits/libhandy

USES=	elementary gettext gnome meson pkgconfig \
	python:3.6+,build
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	granite

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

.include <bsd.port.mk>
