PORTNAME=	wingpanel-indicator-power
PORTVERSION=	6.1.0
CATEGORIES=	sysutils

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Wingpanel power usage indicator

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libnotify.so:devel/libnotify \
		libgtop-2.0.so:devel/libgtop \
		libbamf3.so:sysutils/bamf \
		libudev.so:devel/libudev-devd
RUN_DEPENDS=	upower>0:sysutils/upower

USES=		elementary gettext gnome meson pkgconfig
USE_ELEMENTARY=	granite wingpanel
USE_GNOME=	glib20 gtk30

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

GLIB_SCHEMAS=	io.elementary.desktop.wingpanel.power.gschema.xml

.include <bsd.port.mk>
