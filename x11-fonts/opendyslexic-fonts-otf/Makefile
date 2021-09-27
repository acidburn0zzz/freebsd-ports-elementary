PORTNAME=	opendyslexic
PORTVERSION=	0.91.12
DISTVERSIONPREFIX=	v
CATEGORIES=	x11-fonts
PKGNAMESUFFIX=	-fonts-otf

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	OpenType fonts to help offset some visual symptoms of dyslexia

LICENSE=	OFL11
LICENSE_FILE=	${WRKSRC}/OFL.txt

USES=	fonts

USE_GITHUB=	yes
GH_ACCOUNT=	antijingoist
GH_PROJECT=	open-dyslexic:mono
GH_TAGNAME=	03aa683:mono

NO_ARCH=	yes
NO_BUILD=	yes
SUB_FILES=	pkg-message

FONTNAME=	opendyslexic

do-install:
	${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/compiled/*.otf \
		${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC_mono}/otf/OpenDyslexicMono-Regular.otf \
		${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
