PORTNAME=	wingpanel-indicator-a11y
PORTVERSION=	1.0.0
CATEGORIES=	accessibility

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Wingpanel universal access indicator

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
RUN_DEPENDS=	onboard:accessibility/onboard \
		orca:accessibility/orca

USES=		elementary gettext gnome meson python:3.6+,build \
		pkgconfig
USE_ELEMENTARY=	granite wingpanel
USE_GNOME=	glib20 gtk30

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

BINARY_ALIAS=	python3=${PYTHON_CMD}

GLIB_SCHEMAS=	io.elementary.desktop.wingpanel.a11y.gschema.xml

.include <bsd.port.mk>
