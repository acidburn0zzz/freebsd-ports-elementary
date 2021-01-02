# Created by: Olivier Duchateau
# $FreeBSD$

PORTNAME=	alohomora
PORTVERSION=	1.1.0
DISTVERSIONPREFIX=	v
CATEGORIES=	security

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Password manager

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libsecret-1.so:security/libsecret

USE_GITHUB=	yes
GH_ACCOUNT=	z0o0p
GH_TAGNAME=	4369abb

USES=		gettext elementary gnome meson pkgconfig \
		python:3.6+,build
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	granite
INSTALLS_ICONS=	yes

GLIB_SCHEMAS=	com.github.z0o0p.alohomora.gschema.xml

.include <bsd.port.mk>
