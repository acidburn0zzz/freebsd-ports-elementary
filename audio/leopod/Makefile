PORTNAME=	leopod
PORTVERSION=	1.1.1
DISTVERSIONPREFIX=	v
CATEGORIES=	audio

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Podcast subscription manager designed for elementary OS

LICENSE=	LGPL3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libhandy-1.so:x11-toolkits/libhandy \
		libsoup-2.4.so:devel/libsoup \
		libpulse.so:audio/pulseaudio

USES=		elementary gettext gnome gstreamer meson pkgconfig \
		sqlite:3
USE_ELEMENTARY=	granite
USE_GNOME=	glib20 gtk30 libxml2 gdkpixbuf2
USE_GSTREAMER=	flac good lame libgstreamer ogg plugins vpx

USE_GITHUB=	yes
GH_ACCOUNT=	leggettc18

GLIB_SCHEMAS=	com.github.leggettc18.leopod.gschema.xml

.include <bsd.port.mk>
