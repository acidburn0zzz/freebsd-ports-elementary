PORTNAME=	dippi
PORTVERSION=	3.1.4
CATEGORIES=	deskutils

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Calculate display info and aspect ratio

LICENSE=	GPLv3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libhandy-1.so:x11-toolkits/libhandy
RUN_DEPENDS=	elementary-theme>0:x11-themes/elementary-theme

USES=		elementary gettext gnome meson pkgconfig \
		python:3.6+,build
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	granite

USE_GITHUB=	yes
GH_ACCOUNT=	cassidyjames

# See 25_io.elementary.default-settings.gschema.override
# provided by sysutils/elementary-settings
post-patch:
	${REINPLACE_CMD} -i "" -e 's|.grape|.blueberry|' \
		${WRKSRC}/src/App.vala

.include <bsd.port.mk>
