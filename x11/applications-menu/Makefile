PORTNAME=	applications-menu
PORTVERSION=	2.9.1
CATEGORIES=	x11

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Lightweight and stylish application launcher

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libsoup-2.4.so:devel/libsoup \
		libjson-glib-1.0.so:devel/json-glib \
		libhandy-1.so:x11-toolkits/libhandy
RUN_DEPENDS=	upower>0:sysutils/upower \
		consolekit2>0:sysutils/consolekit2 \
		gnome-settings-daemon>0:sysutils/gnome-settings-daemon

USES=		elementary gettext gnome meson pkgconfig \
		python:3.6+,build
USE_GNOME=	glib20 gtk30 gnomemenus3 gdkpixbuf2
USE_ELEMENTARY=	granite plank switchboard wingpanel

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

MESON_ARGS=	-Dwith-zeitgeist=false

GLIB_SCHEMAS=	io.elementary.desktop.wingpanel.applications-menu.gschema.xml

.include <bsd.port.mk>
