# Created by: Olivier Duchateau
# $FreeBSD$

PORTNAME=	wingpanel-indicator-keyboard
PORTVERSION=	2.2.1
CATEGORIES=	x11

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Wingpanel Keyboard Indicator

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
RUN_DEPENDS=	xkeyboard-config>=2.27:x11/xkeyboard-config \
		gsettings-desktop-schemas>=3.28:devel/gsettings-desktop-schemas

USES=		elementary gettext gnome meson pkgconfig \
		python:3.5+,build
USE_GNOME=	glib20 gtk30 libgnomekbd libxml2
USE_ELEMENTARY=	granite wingpanel

GH_ACCOUNT=	elementary
USE_GITHUB=	yes

post-patch:
	${REINPLACE_CMD} -i '' -e 's|/usr|${PREFIX}|' \
		${WRKSRC}/src/LayoutsManager.vala

.include <bsd.port.mk>
