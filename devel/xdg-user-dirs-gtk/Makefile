# Created by: Olivier Duchateau
# $FreeBSD$

PORTNAME=	xdg-user-dirs-gtk
PORTVERSION=	0.10
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Gtk+ integration of special directories

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	xdg-user-dir:devel/xdg-user-dirs
LIB_DEPENDS=	libharfbuzz.so:print/harfbuzz

USES=		gettext gmake gnome pkgconfig tar:xz
GNU_CONFIGURE=	yes
USE_GNOME=	glib20 gtk30 intltool intlhack cairo gdkpixbuf2

.include <bsd.port.mk>
