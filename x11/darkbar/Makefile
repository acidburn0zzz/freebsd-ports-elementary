# Created by: Olivier Duchateau

PORTNAME=	darkbar
PORTVERSION=	0.1.2
CATEGORIES=	x11

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Darken application titlebars based on your preference

LICENSE=	GPLv3+
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libhandy-1.so:x11-toolkits/libhandy
RUN_DEPENDS=	xprop:x11/xprop

USES=		elementary gettext gnome meson pkgconfig \
		python:3.6+,build
USE_GNOME=	glib20 gtk30 libwnck3
USE_ELEMENTARY=	granite

USE_GITHUB=	yes
GH_ACCOUNT=	bluesabre


GLIB_SCHEMAS=	com.github.bluesabre.darkbar.gschema.xml

.include <bsd.port.mk>
