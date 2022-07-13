PORTNAME=	switchboard-plug-sound
PORTVERSION=	2.3.1
CATEGORIES=	audio

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Switchboard sound plugin

LICENSE=	LGPL21
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libpulse.so:audio/pulseaudio \
		libcanberra.so:audio/libcanberra \
		libcanberra-gtk3.so:audio/libcanberra-gtk3 \
		libgee-0.8.so:devel/libgee

USES=		elementary gettext gnome meson pkgconfig
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	granite switchboard

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

.include <bsd.port.mk>
