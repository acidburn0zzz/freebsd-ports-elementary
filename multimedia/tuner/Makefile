# Created by: Olivier Duchateau

PORTNAME=	tuner
PORTVERSION=	1.3.1
CATEGORIES=	multimedia

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Minimalist Internet radio stations player

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libsoup-2.4.so:devel/libsoup \
		libjson-glib-1.0.so:devel/json-glib \
		libgeoclue-2.so:net/geoclue \
		libgeocode-glib.so:net/geocode-glib

USES=		elementary gettext gnome meson pkgconfig \
		python:3.6+,build
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	granite
USE_GSTREAMER1=	yes bad ugly flac lame libav ogg opus pulse \
		soup taglib vorbis webp
INSTALLS_ICONS=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	louis77
GH_TAGNAME=	7d24d99

GLIB_SCHEMAS=	com.github.louis77.tuner.gschema.xml

.include <bsd.port.mk>
