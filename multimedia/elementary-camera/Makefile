PORTNAME=	camera
PORTVERSION=	6.2.0
CATEGORIES=	multimedia
PKGNAMEPREFIX=	elementary-

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Webcam application designed for elementary OS

LICENSE=	GPLv3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libcanberra.so:audio/libcanberra \
		libhandy-1.so:x11-toolkits/libhandy
RUN_DEPENDS=	webcamd>0:multimedia/webcamd

USES=	elementary gettext gnome gstreamer meson pkgconfig \
	python:3.7+,build
USE_GNOME=	glib20 gtk30
USE_GSTREAMER=	good gtk jpeg libgstreamer ogg plugins v4l2 vorbis vpx
USE_ELEMENTARY=	granite

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

GLIB_SCHEMAS=	io.elementary.camera.gschema.xml

.include <bsd.port.mk>
