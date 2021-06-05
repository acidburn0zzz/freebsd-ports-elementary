# Created by: Olivier Duchateau

PORTNAME=	wingpanel-indicator-session
PORTVERSION=	2.2.8
CATEGORIES=	x11-wm

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Wingpanel session indicator

LICENSE=	GPLv2+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libaccountsservice.so:sysutils/accountsservice \
		libgee-0.8.so:devel/libgee
RUN_DEPENDS=	consolekit2>=1.2.0:sysutils/consolekit2 \
		gnome-settings-daemon>=3.28.0:sysutils/gnome-settings-daemon \
		lightdm>0:x11/lightdm \
		gnome-session:x11/gnome-session

USES=		elementary gettext gnome meson pkgconfig \
		python:3.5+,build
USE_GNOME=	glib20 gtk30 gdkpixbuf2
USE_ELEMENTARY=	granite wingpanel

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

.include <bsd.port.mk>
