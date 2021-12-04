PORTNAME=	AppStream
PORTVERSION=	0.15.0
CATEGORIES=	devel
MASTER_SITES=	https://www.freedesktop.org/software/${PORTNAME:tl}/releases/

MAINTAINER=	desktop@FreeBSD.org
COMMENT=	Machine-readable software metadata for desktop environments

LICENSE=	GPLv2+ LGPL21+
LICENSE_COMB=	multi

BUILD_DEPENDS=	valac:lang/vala \
		lmdb>0:databases/lmdb \
		gperf>0:devel/gperf \
		itstool>0:textproc/itstool
# This line will be removed when textproc/libxmlb will be available
# https://reviews.freebsd.org/D29332
BUILD_DEPENDS+=	git:devel/git
LIB_DEPENDS=	libcurl.so:ftp/curl \
		libyaml.so:textproc/libyaml \
		liblmdb.so:databases/lmdb

USES=		gettext gnome meson pkgconfig python:3.6+,build tar:xz

USE_GNOME=	glib20 introspection:build libxml2

BINARY_ALIAS=	python3=${PYTHON_CMD}

MESON_ARGS=	-Dstemming=false \
		-Dvapi=true \
		-Dapidocs=false \
		-Dinstall-docs=false
# libxmlb subproject options
MESON_ARGS+=	-Dlibxmlb:gtkdoc=false \
		-Dlibxmlb:tests=false \
		-Dlibxmlb:stemmer=false \
		-Dlibxmlb:cli=false

.include <bsd.port.mk>
