# Created by: Olivier Duchateau

PORTNAME=	inter-fonts-otf
DISTVERSION=	3.19
CATEGORIES=	x11-fonts
MASTER_SITES=	https://github.com/rsms/inter/releases/download/v${DISTVERSION}/
DISTNAME=	Inter-${DISTVERSION}

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	OpenType font designed for user interfaces

LICENSE=	OFL11
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=	fonts zip

WRKSRC=	${WRKDIR}

NO_ARCH=	yes
NO_BUILD=	yes
SUB_FILES=	pkg-message

FONTNAME=	inter

do-install:
	${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/Inter\ Desktop/*.otf \
		${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
