# Created by: Olivier Duchateau
# $FreeBSD$

PORTNAME=	wingpanel
PORTVERSION=	2.3.1
CATEGORIES=	x11

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Stylish top panel for the Pantheon desktop

LICENSE=	GPLv3

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libmutter-6.so:x11-wm/mutter

USES=		elementary gettext gnome meson pkgconfig \
		python:3.5+,build
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	gala
INSTALLS_ICONS=	yes

GH_ACCOUNT=	elementary
USE_GITHUB=	yes

GLIB_SCHEMAS=	io.elementary.desktop.wingpanel.gschema.xml

.include <bsd.port.mk>
