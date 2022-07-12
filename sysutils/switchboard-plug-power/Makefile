PORTNAME=	switchboard-plug-power
PORTVERSION=	2.7.0
CATEGORIES=	sysutils

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Switchboard power manager plugin

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala \
		dbus>0:devel/dbus
LIB_DEPENDS=	libpolkit-gobject-1.so:sysutils/polkit \
		libgee-0.8.so:devel/libgee
RUN_DEPENDS=	gnome-settings-daemon>0:sysutils/gnome-settings-daemon \
		upower>0:sysutils/upower

USES=		elementary gettext gnome meson pkgconfig
USE_ELEMENTARY=	granite switchboard
USE_GNOME=	glib20 gtk30

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

post-patch:
	${REINPLACE_CMD} -e 's|%%PREFIX%%|${LOCALBASE}|' \
		${WRKSRC}/cli/Server.vala

.include <bsd.port.mk>
