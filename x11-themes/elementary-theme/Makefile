# Created by: Olivier Duchateau

PORTNAME=	elementary
PORTVERSION=	5.4.2
CATEGORIES=	x11-themes
PKGNAMESUFFIX=	-theme

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Gtk themes for the Elementary desktop

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

RUN_DEPENDS=	gtk-murrine-engine>=0.98.1:x11-themes/gtk-murrine-engine \
		gnome-icons-elementary>0:x11-themes/gnome-icons-elementary

USES=		gettext meson python:3.5+,build

GH_ACCOUNT=	elementary
GH_PROJECT=	stylesheet
USE_GITHUB=	yes

.include <bsd.port.mk>
