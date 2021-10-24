PORTNAME=	taxi
PORTVERSION=	2.0.2
CATEGORIES=	ftp

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	FTP client designed for the Elementary desktop

LICENSE=	LGPL3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libhandy-1.so:x11-toolkits/libhandy \
		libsoup-2.4.so:devel/libsoup
RUN_DEPENDS=	gvfs>0:devel/gvfs

USES=		elementary gettext gnome meson pkgconfig \
		python:3.6+,build
USE_GNOME=	glib20 gtk30 cairo
USE_ELEMENTARY=	granite

USE_GITHUB=	yes
GH_ACCOUNT=	Alecaddd

GLIB_SCHEMAS=	com.github.alecaddd.taxi.gschema.xml

.include <bsd.port.mk>
