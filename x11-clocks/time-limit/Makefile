PORTNAME=	time-limit
PORTVERSION=	3.0.0
CATEGORIES=	x11-clocks

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Simple and beautiful timer

LICENSE=	GPLv3

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libhandy-1.so:x11-toolkits/libhandy

USES=		elementary gettext gnome meson pkgconfig \
		python:3.7+,build
USE_GNOME=	cairo glib20 gtk40
USE_ELEMENTARY=	granite7

USE_GITHUB=	yes
GH_ACCOUNT=	marbetschar

BINARY_ALIAS=	python3=${PYTHON_CMD}

GLIB_SCHEMAS=	com.github.marbetschar.time-limit.gschema.xml

.include <bsd.port.mk>
