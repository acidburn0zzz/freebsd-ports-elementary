PORTNAME=	wallpapers
PORTVERSION=	6.1.0
CATEGORIES=	x11-themes
DIST_SUBDIR=	elementary
PKGNAMEPREFIX=	elementary-

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Collection of wallpapers for elementary OS

LICENSE=	CC0-1.0 GPLv3+
LICENSE_COMB=	multi

USES=		gettext meson pkgconfig

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

post-extract:
	${CHMOD} a-x "${WRKSRC}/backgrounds/Ashim DSilva.jpg"

post-install:
	${RLN} "${STAGEDIR}${PREFIX}/share/backgrounds/odin-dark.jpg" \
		${STAGEDIR}${PREFIX}/share/backgrounds/elementaryos-default

.include <bsd.port.mk>
