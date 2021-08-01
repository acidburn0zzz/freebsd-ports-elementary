# Created by: Olivier Duchateau

PORTNAME=	camera
PORTVERSION=	6.0.0
CATEGORIES=	multimedia
PKGNAMEPREFIX=	elementary-

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Webcam application designed for the Elementary desktop

LICENSE=	GPLv3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libcanberra.so:audio/libcanberra \
		libhandy-1.so:x11-toolkits/libhandy
RUN_DEPENDS=	webcamd>0:multimedia/webcamd

USES=	elementary gettext gnome meson pkgconfig \
	python:3.6+,build
USE_GNOME=	glib20 gtk30
USE_GSTREAMER1=	yes good gtk jpeg ogg v4l2 vorbis vpx
USE_ELEMENTARY=	granite
INSTALLS_ICONS=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

GLIB_SCHEMAS=	io.elementary.camera.gschema.xml

.include <bsd.port.mk>
