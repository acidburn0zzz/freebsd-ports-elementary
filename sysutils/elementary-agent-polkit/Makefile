# Created by: Olivier Duchateau
# $FreeBSD$

PORTNAME=	pantheon-agent-polkit
PORTVERSION=	1.0.3
CATEGORIES=	sysutils

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Polkit agent for the Pantheon desktop

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala

LIB_DEPENDS=	libpolkit-agent-1.so:sysutils/polkit

USES=	elementary gettext gnome meson pkgconfig \
	python:3.5+,build
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	granite

GH_ACCOUNT=	elementary
USE_GITHUB=	yes

.include <bsd.port.mk>
