# Created by: Olivier Duchateau
# $FreeBSD$

PORTNAME=	gala
PORTVERSION=	3.3.2
CATEGORIES=	x11-wm

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Window manager for the Pantheon desktop

LICENSE=	GPLv3

BUILD_DEPENDS=	valac:lang/vala \
		gnome-settings-daemon>=3.28:sysutils/gnome-settings-daemon
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libmutter-6.so:x11-wm/mutter \
		libclutter-gtk-1.0.so:graphics/clutter-gtk3 \
		libbamf3.so:sysutils/bamf \
		libcanberra.so:audio/libcanberra \
		libcanberra-gtk3.so:audio/libcanberra-gtk3 \
		libgraphene-1.0.so:graphics/graphene
RUN_DEPENDS=	gsettings-desktop-schemas>=3.28:devel/gsettings-desktop-schemas 

USES=		elementary gettext gnome meson pkgconfig \
		python:3.5+,build xorg
USE_GNOME=	glib20 gtk30 gnomedesktop3 cairo gdkpixbuf2
USE_ELEMENTARY=	granite plank
INSTALL_ICONS=	yes
USE_XORG=	xfixes

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

GLIB_SCHEMAS=	org.pantheon.desktop.gala.gschema.xml

.include <bsd.port.mk>
