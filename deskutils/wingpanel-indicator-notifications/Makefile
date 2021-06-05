# Created by: Olivier Duchateau

PORTNAME=	wingpanel-indicator-notifications
PORTVERSION=	2.1.4
CATEGORIES=	deskutils

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Wingpanel Notifications Indicator

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee
RUN_DEPENDS=	notification-daemon>=3.20.0:deskutils/notification-daemon

USES=		elementary gettext gnome meson pkgconfig \
		python:3.5+,build
USE_GNOME=	glib20 gtk30 libwnck3
USE_ELEMENTARY=	granite wingpanel

GH_ACCOUNT=	elementary
USE_GITHUB=	yes

.include <bsd.port.mk>
