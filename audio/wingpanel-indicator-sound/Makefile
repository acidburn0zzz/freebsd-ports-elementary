PORTNAME=	wingpanel-indicator-sound
PORTVERSION=	6.0.0
CATEGORIES=	audio

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Wingpanel Sound Indicator

LICENSE=	GPLv3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libnotify.so:devel/libnotify \
		libpulse.so:audio/pulseaudio \
		libcanberra.so:audio/libcanberra \
		libcanberra-gtk3.so:audio/libcanberra-gtk3

USES=		elementary gettext gnome meson pkgconfig \
		python:3.6+,build
USE_GNOME=	glib20 gtk30 cairo gdkpixbuf2
USE_ELEMENTARY=	granite wingpanel

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

GLIB_SCHEMAS=	io.elementary.desktop.wingpanel.sound.gschema.xml

.include <bsd.port.mk>
