PORTNAME=	switchboard-plug-printers
PORTVERSION=	2.1.10
CATEGORIES=	print

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Switchboard printers plugin

LICENSE=	GPLv3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libcups.so:print/cups
RUN_DEPENDS=	cups-pk-helper>0:print/cups-pk-helper

USES=		elementary gettext gnome meson pkgconfig \
		python:3.6+,build
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	granite switchboard

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

.include <bsd.port.mk>
