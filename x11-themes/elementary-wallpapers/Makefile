PORTNAME=	wallpapers
PORTVERSION=	6.0.0
CATEGORIES=	x11-themes
PKGNAMEPREFIX=	elementary-

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Collection of wallpapers for the Elementary desktop

LICENSE=	CC0-1.0 GPLv3+
LICENSE_COMB=	multi

USES=		gettext meson pkgconfig python:3.5+,build

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

post-extract:
	${CHMOD} a-x "${WRKSRC}/backgrounds/Ashim DSilva.jpg"

post-patch:
	@${REINPLACE_CMD} -i "" -e 's|%%PORTVERSION%%|${PORTVERSION}|' \
		${WRKSRC}/meson.build

post-install:
	${RLN} "${STAGEDIR}${PREFIX}/share/backgrounds/odin.jpg" \
		${STAGEDIR}${PREFIX}/share/backgrounds/elementaryos-default

.include <bsd.port.mk>
