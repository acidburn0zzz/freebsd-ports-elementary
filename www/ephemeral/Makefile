# Created by: Olivier Duchateau

PORTNAME=	ephemeral
PORTVERSION=	7.1.0
CATEGORIES=	www

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Always-incognito web browser

LICENSE=	GPLv3+
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libsoup-2.4.so:devel/libsoup \
		libdazzle-1.0.so:x11-toolkits/libdazzle \
		libwebkit2gtk-4.0.so:www/webkit2-gtk3 \
		libgee-0.8.so:devel/libgee

USES=		desktop-file-utils elementary gettext gnome meson \
		pkgconfig python:3.6+,build
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	granite

USE_GITHUB=	yes
GH_ACCOUNT=	cassidyjames

GLIB_SCHEMAS=	com.github.cassidyjames.ephemeral.gschema.xml

.include <bsd.port.mk>
