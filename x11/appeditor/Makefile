PORTNAME=	appeditor
PORTVERSION=	1.1.3
CATEGORIES=	x11

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Edit menu entries

LICENSE=	GPLv3+
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee
RUN_DEPENDS=	xdg-desktop-portal>0:deskutils/xdg-desktop-portal

USES=		elementary gettext gnome meson pkgconfig \
		python:3.6+,build
USE_GNOME=	glib20 gtk30 cairo
USE_ELEMENTARY=	granite

USE_GITHUB=	yes
GH_ACCOUNT=	donadigo

GLIB_SCHEMAS=	com.github.donadigo.appeditor.gschema.xml

post-patch:
	@${REINPLACE_CMD} -e 's|%%PORTVERSION%%|${PORTVERSION}|' \
		${WRKSRC}/src/Constants.vala

.include <bsd.port.mk>
