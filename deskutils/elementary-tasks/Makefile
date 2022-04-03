PORTNAME=	tasks
PORTVERSION=	6.2.0
CATEGORIES=	deskutils
PKGNAMEPREFIX=	elementary-

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Manage tasks designed for the Elementary desktop

LICENSE=	GPLv3+
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libclutter-1.0.so:graphics/clutter \
		libclutter-gtk-1.0.so:graphics/clutter-gtk3 \
		libsoup-2.4.so:devel/libsoup \
		libgeocode-glib.so:net/geocode-glib \
		libchamplain-0.12.so:graphics/libchamplain \
		libchamplain-gtk-0.12.so:graphics/libchamplain \
		libgeoclue-2.so:net/geoclue \
		libhandy-1.so:x11-toolkits/libhandy \
		libical-glib.so:devel/libical \
		libgdata.so:devel/libgdata
RUN_DEPENDS=	switchboard-plug-onlineaccounts>0:net/switchboard-plug-onlineaccounts

USES=		elementary gettext gnome meson pkgconfig \
		python:3.6+,build
USE_GNOME=	cairo glib20 gtk30 gdkpixbuf2 evolutiondataserver3
USE_ELEMENTARY=	granite

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

GLIB_SCHEMAS=	io.elementary.tasks.gschema.xml

.include <bsd.port.mk>
