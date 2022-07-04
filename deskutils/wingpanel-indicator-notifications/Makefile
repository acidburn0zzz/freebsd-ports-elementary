PORTNAME=	wingpanel-indicator-notifications
PORTVERSION=	6.0.5
CATEGORIES=	deskutils

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Wingpanel Notifications Indicator

LICENSE=	LGPL21
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libhandy-1.so:x11-toolkits/libhandy
RUN_DEPENDS=	notification-daemon>0:deskutils/notification-daemon

USES=		elementary gettext gnome meson pkgconfig \
		python:3.7+,build
USE_GNOME=	cairo gdkpixbuf2 glib20 gtk30
USE_ELEMENTARY=	granite wingpanel

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

.include <bsd.port.mk>
