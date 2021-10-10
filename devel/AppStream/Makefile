PORTNAME=	AppStream
PORTVERSION=	0.14.6
CATEGORIES=	devel
MASTER_SITES=	https://www.freedesktop.org/software/${PORTNAME:tl}/releases/

MAINTAINER=	desktop@FreeBSD.org
COMMENT=	Machine-readable software metadata for desktop environments

LICENSE=	GPLv2+ LGPL21+
LICENSE_COMB=	multi

BUILD_DEPENDS=	valac:lang/vala \
		lmdb>0:databases/lmdb \
		gperf>0:devel/gperf
LIB_DEPENDS=	libcurl.so:ftp/curl \
		libyaml.so:textproc/libyaml \
		liblmdb.so:databases/lmdb

USES=		gettext gnome meson pkgconfig python:3.6+,build tar:xz

USE_GNOME=	glib20 introspection:build libxml2

MESON_ARGS=	-Dstemming=false \
		-Dvapi=true \
		-Dapidocs=false \
		-Dinstall-docs=false

.include <bsd.port.mk>
