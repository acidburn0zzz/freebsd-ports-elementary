PORTNAME=	agent-geoclue2
PORTVERSION=	1.0.5
CATEGORIES=	net
PKGNAMEPREFIX=	elementary-

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Geoclue agent designed for elementary OS

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgeoclue-2.so:net/geoclue

USES=		elementary gettext gnome meson pkgconfig \
		python:3.6+,build
USE_GNOME=	glib20 gtk30

USE_GITHUB=	yes
GH_ACCOUNT=	elementary
GH_PROJECT=	pantheon-agent-geoclue2

GLIB_SCHEMAS=	io.elementary.desktop.agent-geoclue2.gschema.xml

.include <bsd.port.mk>
