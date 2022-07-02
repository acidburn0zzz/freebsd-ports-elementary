PORTNAME=	switchboard-plug-notifications
PORTVERSION=	2.2.0
CATEGORIES=	deskutils

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Switchboard notifications plugin

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee

USES=		elementary gettext gnome meson pkgconfig \
		python:3.7+,build
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	gala granite switchboard

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

.include <bsd.port.mk>
