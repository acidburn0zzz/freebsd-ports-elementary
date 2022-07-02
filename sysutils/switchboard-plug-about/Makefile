PORTNAME=	switchboard-plug-about
PORTVERSION=	6.1.0
CATEGORIES=	sysutils

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Switchboard System plugin

LICENSE=	GPLv3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libhandy-1.so:x11-toolkits/libhandy \
		libgtop-2.0.so:devel/libgtop \
		libappstream.so:devel/appstream
RUN_DEPENDS=	elementary-wallpapers>0:x11-themes/elementary-wallpapers \
		gnome-session>0:x11/gnome-session

USES=		elementary gettext gnome meson pkgconfig \
		python:3.7+,build
USE_GNOME=	glib20 gtk30 gdkpixbuf2
USE_ELEMENTARY=	granite switchboard

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

post-patch:
	${REINPLACE_CMD} -i "" -e 's|/usr|${LOCALBASE}|' \
		${WRKSRC}/src/Views/OperatingSystemView.vala

.include <bsd.port.mk>
