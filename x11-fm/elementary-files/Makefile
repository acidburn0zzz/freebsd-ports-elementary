# Created by: Olivier Duchateau
# $FreeBSD$

PORTNAME=	files
PORTVERSION=	4.5.0
CATEGORIES=	x11-fm
PKGNAMEPREFIX=	elementary-

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	File browser for the Elementary desktop

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libcanberra.so:audio/libcanberra \
		libnotify.so:devel/libnotify \
		libgit2-glib-1.0.so:devel/libgit2-glib
RUN_DEPENDS=	pkexec:sysutils/polkit

USES=		desktop-file-utils elementary gettext gnome meson pkgconfig \
		python:3.5+,build sqlite:3
USE_GNOME=	glib20 gtk30 cairo gdkpixbuf2 pango gvfs
USE_ELEMENTARY=	granite

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

MESON_ARGS=	-Dwith-unity=disabled \
		-Dwith-zeitgeist=disabled

GLIB_SCHEMAS=	io.elementary.files.gschema.xml

.include <bsd.port.mk>
