# Created by: Olivier Duchateau

PORTNAME=	wingpanel-indicator-sound
PORTVERSION=	2.1.8
CATEGORIES=	audio

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Wingpanel Sound Indicator

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libnotify.so:devel/libnotify \
		libpulse.so:audio/pulseaudio \
		libcanberra.so:audio/libcanberra \
		libcanberra-gtk3.so:audio/libcanberra-gtk3

USES=		elementary gettext gnome meson pkgconfig \
		python:3.5+,build
USE_GNOME=	glib20 gtk30 cairo gdkpixbuf2
USE_ELEMENTARY=	granite wingpanel

GH_ACCOUNT=	elementary
USE_GITHUB=	yes

GLIB_SCHEMAS=	io.elementary.desktop.wingpanel.sound.gschema.xml

.include <bsd.port.mk>
