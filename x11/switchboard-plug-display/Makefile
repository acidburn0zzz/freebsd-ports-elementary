# Created by: Olivier Duchateau

PORTNAME=	switchboard-plug-display
PORTVERSION=	2.2.2
CATEGORIES=	x11

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Switchboard displays plugin

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libmutter-6.so:x11-wm/mutter
RUN_DEPENDS=	gnome-settings-daemon>=3.28:sysutils/gnome-settings-daemon

USES=		elementary gettext gnome meson pkgconfig \
		python:3.5+,build
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	granite switchboard

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

.include <bsd.port.mk>
