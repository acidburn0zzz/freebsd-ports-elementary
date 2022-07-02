PORTNAME=	switchboard-plug-mouse-touchpad
PORTVERSION=	7.0.0
CATEGORIES=	x11

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Switchboard mouse and touchpad plugin

LICENSE=	GPLv3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee
RUN_DEPENDS=	gnome-settings-daemon>0:sysutils/gnome-settings-daemon \
		gsettings-desktop-schemas>0:devel/gsettings-desktop-schemas

USES=		elementary gettext gnome meson pkgconfig \
		python:3.7+,build
USE_GNOME=	glib20 gtk30 libxml2
USE_ELEMENTARY=	granite switchboard

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

.include <bsd.port.mk>
