# Created by: Olivier Duchateau
# $FreeBSD$

PORTNAME=	switchboard-plug-mouse-touchpad
PORTVERSION=	2.4.2
CATEGORIES=	x11

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Switchboard mouse and touchpad plugin

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee
RUN_DEPENDS=	gnome-settings-daemon>=3.28:sysutils/gnome-settings-daemon \
		gsettings-desktop-schemas>=3.28:devel/gsettings-desktop-schemas

USES=		elementary gettext gnome meson pkgconfig \
		python:3.5+,build
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	granite switchboard

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

.include <bsd.port.mk>
