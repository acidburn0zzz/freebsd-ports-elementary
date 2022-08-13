PORTNAME=	iridium
PORTVERSION=	1.9.0
CATEGORIES=	irc
PKGNAMESUFFIX=	-irc

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Friendly IRC client

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libsecret-1.so:security/libsecret \
		libsoup-2.4.so:devel/libsoup \
		libhandy-1.so:x11-toolkits/libhandy

USES=		desktop-file-utils elementary gettext gnome meson \
		pkgconfig sqlite:3

USE_GITHUB=	yes
GH_ACCOUNT=	avojak

USE_ELEMENTARY=	granite
USE_GNOME=	glib20 gtk30 gtksourceview4 cairo

GLIB_SCHEMAS=	com.github.avojak.iridium.gschema.xml

.include <bsd.port.mk>
