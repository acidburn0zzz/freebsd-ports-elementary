# Created by: Olivier Duchateau
# $FreeBSD$

PORTNAME=	screenshot
PORTVERSION=	1.7.1
CATEGORIES=	x11
PKGNAMEPREFIX=	elementary-

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Screenshot tool for the Pantheon desktop

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libcanberra.so:audio/libcanberra
RUN_DEPENDS=	redacted-fonts-ttf>0:x11-fonts/redacted-fonts-ttf

USES=		elementary gettext gnome meson pkgconfig \
		python:3.5+,build
USE_GNOME=	glib20 gtk30 cairo gdkpixbuf2
USE_ELEMENTARY=	granite
INSTALLS_ICONS=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

GLIB_SCHEMAS=	io.elementary.screenshot-tool.gschema.xml

.include <bsd.port.mk>
