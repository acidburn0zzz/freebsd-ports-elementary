PORTNAME=	wingpanel
PORTVERSION=	3.0.2
CATEGORIES=	x11

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Stylish top panel for the Elementary desktop

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libmutter-9.so:x11-wm/mutter
RUN_DEPENDS=	elementary-notifications>0:deskutils/elementary-notifications

USES=		elementary gettext gnome meson pkgconfig \
		python:3.6+,build
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	gala
INSTALLS_ICONS=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

GLIB_SCHEMAS=	io.elementary.desktop.wingpanel.gschema.xml

post-patch:
	@${REINPLACE_CMD} -e 's|%%PREFIX%%|${LOCALBASE}|g' \
		${WRKSRC}/lib/IndicatorManager.vala

.include <bsd.port.mk>
