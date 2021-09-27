PORTNAME=	redacted-fonts-ttf
PORTVERSION=	5.1.0
CATEGORIES=	x11-fonts

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Redacted TrueType Fonts

LICENSE=	OFL11
LICENSE_FILE=	${WRKSRC}/redacted/OFL.txt

USES=		fonts

GH_ACCOUNT=	elementary
GH_PROJECT=	fonts
USE_GITHUB=	yes

NO_ARCH=	yes
NO_BUILD=	yes
SUB_FILES=	pkg-message

FONTNAME=	redacted

do-install:
	${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/redacted/*.ttf ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
