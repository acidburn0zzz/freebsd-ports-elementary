PORTNAME=	wingpanel-indicator-keyboard
PORTVERSION=	2.4.0
CATEGORIES=	x11

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Wingpanel Keyboard Indicator

LICENSE=	GPLv3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libibus-1.0.so:textproc/ibus
RUN_DEPENDS=	xkeyboard-config>0:x11/xkeyboard-config \
		gsettings-desktop-schemas>0:devel/gsettings-desktop-schemas \
		switchboard-plug-keyboard>0:x11/switchboard-plug-keyboard

USES=		elementary gettext gnome meson pkgconfig \
		python:3.6+,build
USE_GNOME=	glib20 gtk30 libgnomekbd libxml2
USE_ELEMENTARY=	granite wingpanel

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

GLIB_SCHEMAS=	io.elementary.wingpanel.keyboard.gschema.xml

.include <bsd.port.mk>
