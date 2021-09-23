PORTNAME=	wingpanel-indicator-session
PORTVERSION=	2.3.0
CATEGORIES=	x11-wm

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Wingpanel session indicator

LICENSE=	GPLv2+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libaccountsservice.so:sysutils/accountsservice \
		libgee-0.8.so:devel/libgee \
		libhandy-1.so:x11-toolkits/libhandy
RUN_DEPENDS=	consolekit2>0:sysutils/consolekit2 \
		gnome-settings-daemon>0:sysutils/gnome-settings-daemon \
		lightdm>0:x11/lightdm \
		gnome-session>0:x11/gnome-session

USES=		elementary gettext gnome meson pkgconfig \
		python:3.6+,build
USE_GNOME=	glib20 gtk30 gdkpixbuf2
USE_ELEMENTARY=	granite wingpanel

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

.include <bsd.port.mk>
