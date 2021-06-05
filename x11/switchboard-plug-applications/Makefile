# Created by: Olivier Duchateau

PORTNAME=	switchboard-plug-applications
PORTVERSION=	2.1.7
CATEGORIES=	x11

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Switchboard applications plugin

LICENSE=	GPLv2+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee

USES=		elementary gettext gnome meson pkgconfig \
		python:3.5+,build
USE_GNOME=	glib20 gtk30 gdkpixbuf2
USE_ELEMENTARY=	granite switchboard

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

.include <bsd.port.mk>
