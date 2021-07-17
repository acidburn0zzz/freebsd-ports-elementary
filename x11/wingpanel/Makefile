# Created by: Olivier Duchateau

PORTNAME=	wingpanel
PORTVERSION=	3.0.0
CATEGORIES=	x11

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Stylish top panel for the Elementary desktop

LICENSE=	GPLv3

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libmutter-7.so:x11-wm/mutter

USES=		elementary gettext gnome meson pkgconfig \
		python:3.5+,build
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	gala
INSTALLS_ICONS=	yes

GH_ACCOUNT=	elementary
USE_GITHUB=	yes

GLIB_SCHEMAS=	io.elementary.desktop.wingpanel.gschema.xml

.include <bsd.port.mk>
