# Created by: Olivier Duchateau

PORTNAME=	wingpanel-indicator-datetime
PORTVERSION=	2.2.5
CATEGORIES=	x11-clocks

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Wingpanel date and time indicator

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libical.so:devel/libical \
		libedataserver-1.2.so:databases/evolution-data-server
RUN_DEPENDS=	consolekit2>=1.2.0:sysutils/consolekit2

USES=		elementary gettext gnome meson pkgconfig \
		python:3.5+,build
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	granite wingpanel

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

GLIB_SCHEMAS=	io.elementary.desktop.wingpanel.datetime.gschema.xml

.include <bsd.port.mk>
