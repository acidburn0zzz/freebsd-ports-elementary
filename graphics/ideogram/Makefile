# Created by: Olivier Duchateau

PORTNAME=	ideogram
PORTVERSION=	1.3.3
CATEGORIES=	graphics

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Insert emoji anywhere

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	valac:lang/vala
RUN_DEPENDS=	gnome-settings-daemon>=3.28:sysutils/gnome-settings-daemon

USES=		elementary gettext gnome meson pkgconfig \
		python:3.5+,build xorg
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	granite
USE_XORG=	x11 xtst
INSTALLS_ICONS=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	cassidyjames
GH_TAGNAME=	aa8d747

.include <bsd.port.mk>
