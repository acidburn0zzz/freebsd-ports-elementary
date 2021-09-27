# Created by: Olivier Duchateau

PORTNAME=	clipped
PORTVERSION=	1.1.1
CATEGORIES=	deskutils

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Clipboard manager for the Elementary desktop

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee

USES=		elementary gettext gnome meson pkgconfig \
		python:3.5+,build sqlite:3 xorg
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	granite
USE_XORG=	x11 xtst
INSTALLS_ICONS=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	davidmhewitt
GH_TAGNAME=	6ac8c54

BINARY_ALIAS=	python3=${PYTHON_CMD}


GLIB_SCHEMAS=	com.github.davidmhewitt.clipped.gschema.xml

.include <bsd.port.mk>
