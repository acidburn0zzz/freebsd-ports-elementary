PORTNAME=	xdg-desktop-portal-pantheon
PORTVERSION=	1.1.0
CATEGORIES=	deskutils

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Pantheon backend for xdg-desktop-portal

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libhandy-1.so:x11-toolkits/libhandy
RUN_DEPENDS=	xdg-desktop-portal>0:deskutils/xdg-desktop-portal

USES=		elementary gettext gnome meson pkgconfig \
		python:3.7+,build
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	granite

USE_GITHUB=	yes
GH_ACCOUNT=	elementary
GH_PROJECT=	portals

.include <bsd.port.mk>
