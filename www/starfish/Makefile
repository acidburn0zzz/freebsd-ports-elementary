PORTNAME=	starfish
DISTVERSION=	1.3.1
CATEGORIES=	www

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Gemini browser designed for elementary OS

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libhandy-1.so:x11-toolkits/libhandy \
		libgtkspell3-3.so:textproc/gtkspell3 \
		libgnutls.so:security/gnutls \
		libgranite.so:x11-toolkits/granite

USES=		desktop-file-utils gettext gnome meson pkgconfig \
		shared-mime-info
USE_GNOME=	gdkpixbuf2 glib20 gtk30

USE_GITHUB=	yes
GH_ACCOUNT=	starfish-app
GH_PROJECT=	Starfish

GLIB_SCHEMAS=	hr.from.josipantolis.starfish.gschema.xml

.include <bsd.port.mk>
