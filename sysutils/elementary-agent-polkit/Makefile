PORTNAME=	agent-polkit
PORTVERSION=	1.0.5
CATEGORIES=	sysutils
PKGNAMEPREFIX=	elementary-

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Polkit agent designed for elementary OS

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala

LIB_DEPENDS=	libpolkit-agent-1.so:sysutils/polkit

USES=	elementary gettext gnome meson pkgconfig
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	granite

USE_GITHUB=	yes
GH_ACCOUNT=	elementary
GH_PROJECT=	pantheon-${PORTNAME}

.include <bsd.port.mk>
