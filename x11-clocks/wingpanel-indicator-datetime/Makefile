PORTNAME=	wingpanel-indicator-datetime
PORTVERSION=	2.4.0
CATEGORIES=	x11-clocks

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Wingpanel date and time indicator

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libical.so:devel/libical \
		libhandy-1.so:x11-toolkits/libhandy
RUN_DEPENDS=	consolekit2>0:sysutils/consolekit2 \
		accountsservice>0:sysutils/accountsservice \
		elementary-calendar>0:deskutils/elementary-calendar \
		elementary-tasks>0:deskutils/elementary-tasks

USES=		elementary gettext gnome meson pkgconfig \
		python:3.7+,build
USE_GNOME=	glib20 gtk30 evolutiondataserver3
USE_ELEMENTARY=	granite wingpanel

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

GLIB_SCHEMAS=	io.elementary.desktop.wingpanel.datetime.gschema.xml

.include <bsd.port.mk>
