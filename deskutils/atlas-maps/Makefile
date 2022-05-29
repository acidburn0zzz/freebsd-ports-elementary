PORTNAME=	atlas
DISTVERSION=	1.0.0
CATEGORIES=	deskutils
PKGNAMESUFFIX=	-maps

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Map viewer designed for elementary OS

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libhandy-1.so:x11-toolkits/libhandy \
		libgeoclue-2.so:net/geoclue \
		libchamplain-0.12.so:graphics/libchamplain \
		libclutter-1.0.so:graphics/clutter \
		libgeocode-glib.so:net/geocode-glib

USES=		elementary gettext gnome meson pkgconfig \
		python:3.6+,build
USE_GNOME=	gdkpixbuf2 glib20 gtk30
USE_ELEMENTARY=	granite

USE_GITHUB=	yes
GH_ACCOUNT=	ryonakano

GLIB_SCHEMAS=	com.github.ryonakano.atlas.gschema.xml

.include <bsd.port.mk>
