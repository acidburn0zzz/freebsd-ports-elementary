PORTNAME=	hourglass
PORTVERSION=	2.0.0
CATEGORIES=	x11-clocks
PKGNAMESUFFIX=	-timer

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Simple clock, alarms, and timers application

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee

USES=		elementary gettext gnome meson pkgconfig \
		python:3.6+,build
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	granite

USE_GITHUB=	yes
GH_ACCOUNT=	sgpthomas

GLIB_SCHEMAS=	com.github.sgpthomas.hourglass.gschema.xml

.include <bsd.port.mk>
