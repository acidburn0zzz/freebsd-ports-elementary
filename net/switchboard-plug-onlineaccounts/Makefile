PORTNAME=	switchboard-plug-onlineaccounts
PORTVERSION=	6.2.1
CATEGORIES=	net

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Switchboard online accounts plugin

LICENSE=	GPLv2+
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libhandy-1.so:x11-toolkits/libhandy \
		libsoup-2.4.so:devel/libsoup

USES=		elementary gettext gnome meson pkgconfig \
		python:3.6+,build
USE_GNOME=	glib20 gtk30 evolutiondataserver3
USE_ELEMENTARY=	granite switchboard

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

.include <bsd.port.mk>
