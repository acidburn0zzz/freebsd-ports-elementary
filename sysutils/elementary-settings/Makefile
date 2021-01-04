# Created by: Olivier Duchateau
# $FreeBSD$

PORTNAME=	elementary-settings
PORTVERSION=	5.2.3
CATEGORIES=	sysutils
MASTER_SITES=	https://codeberg.org/olivierd/elementary-settings/archive/
DISTNAME=	${PORTVERSION}
DIST_SUBDIR=	elementary

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Default settings for the Elementary desktop

LICENSE=	BSD2CLAUSE

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libaccountsservice.so:sysutils/accountsservice
RUN_DEPENDS=	gnome-icons-elementary>=4.3.1:x11-themes/gnome-icons-elementary \
		elementary-theme>=5.4.0:x11-themes/elementary-theme \
		elementary-sound-theme>0:audio/elementary-sound-theme \
		gnome-backgrounds>0:x11-themes/gnome-backgrounds \
		open-sans>=0:x11-fonts/open-sans \
		roboto-fonts-ttf>=2.134:x11-fonts/roboto-fonts-ttf

USES=		gnome meson pkgconfig python:3.5+,build
USE_GNOME=	glib20 gtk30

WRKSRC=		${WRKDIR}/${PORTNAME}

GLIB_SCHEMAS=	25_elementary.default-settings.gschema.override

.include <bsd.port.mk>
