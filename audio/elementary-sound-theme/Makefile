# Created by: Olivier Duchateau
# $FreeBSD$

PORTNAME=	sound-theme
PORTVERSION=	1.0
CATEGORIES=	audio
PKGNAMEPREFIX=	elementary-

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	System sounds for the Elementary desktop

LICENSE=	Unlicense
LICENSE_PERMS=	dist-mirror pkg-mirror auto-accept
LICENSE_NAME=	The Unlicense
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	freedesktop-sound-theme>=0.8:audio/freedesktop-sound-theme

USES=		meson elementary python:3.5+,build

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

.include <bsd.port.mk>
