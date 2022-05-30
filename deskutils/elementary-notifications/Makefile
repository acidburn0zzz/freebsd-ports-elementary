PORTNAME=	notifications
PORTVERSION=	6.0.1
CATEGORIES=	deskutils
PKGNAMEPREFIX=	elementary-

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Notification server designed for elementary OS

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libhandy-1.so:x11-toolkits/libhandy \
		libcanberra.so:audio/libcanberra \
		libcanberra-gtk3.so:audio/libcanberra-gtk3 \
		libgee-0.8.so:devel/libgee
RUN_DEPENDS=	notification-daemon>0:deskutils/notification-daemon

USES=		elementary gettext gnome meson pkgconfig \
		python:3.6+,build
USE_GNOME=	cairo glib20 gdkpixbuf2 gtk30
USE_ELEMENTARY=	granite

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

BINARY_ALIAS=	python3=${PYTHON_CMD}

GLIB_SCHEMAS=	io.elementary.notifications.gschema.xml

.include <bsd.port.mk>
