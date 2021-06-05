# Created by: Olivier Duchateau

PORTNAME=	switchboard-plug-notifications
PORTVERSION=	2.1.7
CATEGORIES=	deskutils

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Switchboard notifications plugin

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee

USES=		elementary gettext gnome meson pkgconfig \
		python:3.5+,build
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	gala granite switchboard
INSTALLS_ICONS=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

.include <bsd.port.mk>
