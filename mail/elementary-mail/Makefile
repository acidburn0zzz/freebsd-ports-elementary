PORTNAME=	mail
PORTVERSION=	7.0.0
CATEGORIES=	mail
PKGNAMEPREFIX=	elementary-

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Mail application designed for the Elementary desktop

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

#BROKEN=		crash at runtime

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libhandy-1.so:x11-toolkits/libhandy \
		libfolks.so:net-im/folks \
		libwebkit2gtk-4.0.so:www/webkit2-gtk3 \
		libsoup-2.4.so:devel/libsoup

USES=		desktop-file-utils elementary gettext gnome meson pkgconfig \
		python:3.6+,build
USE_GNOME=	glib20 gtk30 evolutiondataserver3 gdkpixbuf2
USE_ELEMENTARY=	granite

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

GLIB_SCHEMAS=	io.elementary.mail.gschema.xml

.include <bsd.port.mk>
