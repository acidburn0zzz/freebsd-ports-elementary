# Created by: Olivier Duchateau

PORTNAME=	appeditor
PORTVERSION=	1.1.1
CATEGORIES=	x11

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Edit application entries shown in application menu

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee
RUN_DEPENDS=	contractor:sysutils/contractor

USES=		elementary gettext gnome meson pkgconfig \
		python:3.6+,build
USE_GNOME=	glib20 gtk30 cairo
USE_ELEMENTARY=	granite

USE_GITHUB=	yes
GH_ACCOUNT=	donadigo
GH_TAGNAME=	41176cf

GLIB_SCHEMAS=	com.github.donadigo.appeditor.gschema.xml

post-patch:
	@${REINPLACE_CMD} -i "" -e 's|0.9.3|${PORTVERSION}|' \
		${WRKSRC}/src/Constants.vala

.include <bsd.port.mk>
