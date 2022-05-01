PORTNAME=	elementary
PORTVERSION=	7.0.0
CATEGORIES=	x11-themes
DIST_SUBDIR=	elementary
PKGNAMESUFFIX=	-theme

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Gtk themes for the Elementary desktop

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	sassc:textproc/sassc
RUN_DEPENDS=	gnome-icons-elementary>0:x11-themes/gnome-icons-elementary \
		inter-fonts-otf>0:x11-fonts/inter-fonts-otf

USES=		gettext meson python:3.6+,build

USE_GITHUB=	yes
GH_ACCOUNT=	elementary
GH_PROJECT=	stylesheet

.include <bsd.port.mk>
