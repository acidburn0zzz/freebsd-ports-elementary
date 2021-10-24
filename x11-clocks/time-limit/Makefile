PORTNAME=	time-limit
PORTVERSION=	2.0.1
CATEGORIES=	x11-clocks

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Simple and beautiful timer

LICENSE=	GPLv3

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libhandy-1.so:x11-toolkits/libhandy

USES=		elementary gnome meson pkgconfig \
		python:3.6+,build
USE_GNOME=	cairo glib20 gtk30
USE_ELEMENTARY=	granite

USE_GITHUB=	yes
GH_ACCOUNT=	marbetschar

BINARY_ALIAS=	python3=${PYTHON_CMD}

GLIB_SCHEMAS=	com.github.marbetschar.time-limit.gschema.xml

.include <bsd.port.mk>
