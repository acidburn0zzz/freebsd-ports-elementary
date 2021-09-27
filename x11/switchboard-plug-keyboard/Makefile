PORTNAME=	switchboard-plug-keyboard
PORTVERSION=	2.5.1
CATEGORIES=	x11

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Switchboard keyboard plugin

LICENSE=	GPLv2+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libmutter-7.so:x11-wm/mutter \
		libxklavier.so:x11/libxklavier \
		libibus-1.0.so:textproc/ibus \
		libhandy-1.so:x11-toolkits/libhandy
RUN_DEPENDS=	gsettings-desktop-schemas>0:devel/gsettings-desktop-schemas \
		xkeyboard-config>0:x11/xkeyboard-config \
		setxkbmap:x11/setxkbmap

USES=		elementary gettext gnome meson pkgconfig \
		python:3.6+,build
USE_GNOME=	glib20 gtk30 libxml2 libgnomekbd
USE_ELEMENTARY=	gala granite switchboard

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

.include <bsd.port.mk>
