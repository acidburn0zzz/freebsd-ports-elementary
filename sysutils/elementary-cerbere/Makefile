# Created by: Olivier Duchateau

PORTNAME=	cerbere
PORTVERSION=	2.5.1
CATEGORIES=	sysutils
PKGNAMEPREFIX=	elementary-

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Simple service to ensure uptime of essential processes

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee
RUN_DEPENDS=	gnome-session>=3.28.0:x11/gnome-session

USES=		elementary gnome meson pkgconfig python:3.5+,build
USE_GNOME=	glib20

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

GLIB_SCHEMAS=	io.elementary.cerbere.gschema.xml

.include <bsd.port.mk>
