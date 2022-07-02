PORTNAME=	wingpanel-indicator-nightlight
PORTVERSION=	2.1.0
CATEGORIES=	x11

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Wingpanel night light indicator

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
RUN_DEPENDS=	gnome-settings-daemon>0:sysutils/gnome-settings-daemon

USES=		elementary gettext gnome meson pkgconfig \
		python:3.7+,build
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	granite wingpanel

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

.include <bsd.port.mk>
