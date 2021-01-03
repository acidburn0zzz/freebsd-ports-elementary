# Created by: Olivier Duchateau
# $FreeBSD$

PORTNAME=	switchboard-plug-keyboard
PORTVERSION=	2.4.1
CATEGORIES=	x11

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Switchboard keyboard plugin

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libmutter-6.so:x11-wm/mutter \
		libxklavier.so:x11/libxklavier \
		libibus-1.0.so:textproc/ibus
RUN_DEPENDS=	gsettings-desktop-schemas>=3.28:devel/gsettings-desktop-schemas \
		xkeyboard-config>=2.27:x11/xkeyboard-config \
		setxkbmap:x11/setxkbmap

USES=		elementary gettext gnome meson pkgconfig \
		python:3.5+,build
USE_GNOME=	glib20 gtk30 libxml2 libgnomekbd
USE_ELEMENTARY=	gala granite switchboard

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

.include <bsd.port.mk>
