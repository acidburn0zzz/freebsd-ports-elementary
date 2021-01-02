# Created by: Olivier Duchateau
# $FreeBSD$

PORTNAME=	agent-geoclue2
PORTVERSION=	1.0.4
CATEGORIES=	net
PKGNAMEPREFIX=	elementary-

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Geoclue agent for the Pantheon desktop

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgeoclue-2.so:net/geoclue

USES=		elementary gettext gnome meson pkgconfig \
		python:3.5+,build
USE_GNOME=	glib20 gtk30

USE_GITHUB=	yes
GH_ACCOUNT=	elementary
GH_PROJECT=	pantheon-agent-geoclue2

GLIB_SCHEMAS=	io.elementary.desktop.agent-geoclue2.gschema.xml

.include <bsd.port.mk>
