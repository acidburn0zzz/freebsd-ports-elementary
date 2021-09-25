PORTNAME=	switchboard-plug-useraccounts
PORTVERSION=	2.4.0
CATEGORIES=	sysutils

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Switchboard user accounts plugin

LICENSE=	LGPL3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libhandy-1.so:x11-toolkits/libhandy \
		libpwquality.so:security/libpwquality \
		libpolkit-gobject-1.so:sysutils/polkit

USES=		elementary gettext gnome meson pkgconfig \
		python:3.6+,build
USE_GNOME=	glib20 gtk30 gnomedesktop3
USE_ELEMENTARY=	granite switchboard

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

#post-patch:
#	@${REINPLACE_CMD} -e 's|%%PREFIX%%|${LOCALBASE}|g' \
#		${WRKSRC}/cli/GuestSessionToggle.vala

.include <bsd.port.mk>
