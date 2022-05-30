PORTNAME=	screenrec
DISTVERSION=	3.1.0
CATEGORIES=	multimedia

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Simple screen recorder designed for elementary OS

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libhandy-1.so:x11-toolkits/libhandy \
		libpulse.so:audio/pulseaudio \
		libclutter-1.0.so:graphics/clutter \
		libclutter-gtk-1.0.so:graphics/clutter-gtk3 \
		libclutter-gst-3.0.so:multimedia/clutter-gst3

USES=		elementary gettext gnome gstreamer meson pkgconfig \
		python:3.6+,build xorg
USE_ELEMENTARY=	granite
USE_GNOME=	glib20 gtk30 cairo
USE_GSTREAMER=	good jpeg lame libav libgstreamer plugins pulse vorbis \
		vpx ximagesrc
USE_XORG=	x11

USE_GITHUB=	yes
GH_ACCOUNT=	dr-Styki
GH_PROJECT=	ScreenRec

BINARY_ALIAS=	python3=${PYTHON_CMD}

GLIB_SCHEMAS=	com.github.dr_styki.screenrec.gschema.xml

.include <bsd.port.mk>
