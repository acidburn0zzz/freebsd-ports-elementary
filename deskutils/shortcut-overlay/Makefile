# Created by: Olivier Duchateau
# $FreeBSD$

PORTNAME=	shortcut-overlay
PORTVERSION=	1.1.2
CATEGORIES=	deskutils

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Keyboard shortcuts applet

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee

USES=	elementary gettext gnome meson pkgconfig \
	python:3.5+,build
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	granite

GH_ACCOUNT=	elementary
USE_GITHUB=	yes

.include <bsd.port.mk>
