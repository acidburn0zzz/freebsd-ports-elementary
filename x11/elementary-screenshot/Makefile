PORTNAME=	screenshot
PORTVERSION=	6.0.0
CATEGORIES=	x11
PKGNAMEPREFIX=	elementary-

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Screenshot tool for the Elementary desktop

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libhandy-1.so:x11-toolkits/libhandy
RUN_DEPENDS=	redacted-fonts-ttf>0:x11-fonts/redacted-fonts-ttf \
		gnome-shell>0:x11/gnome-shell

USES=		elementary gettext gnome meson pkgconfig \
		python:3.5+,build
USE_GNOME=	glib20 gtk30 cairo gdkpixbuf2
USE_ELEMENTARY=	granite
INSTALLS_ICONS=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

GLIB_SCHEMAS=	io.elementary.screenshot.gschema.xml

.include <bsd.port.mk>
