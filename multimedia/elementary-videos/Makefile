PORTNAME=	videos
DISTVERSION=	2.7.3
CATEGORIES=	multimedia
PKGNAMEPREFIX=	elementary-

MAINTAINER=	miguel@gocobachi.dev
COMMENT=	Elementary OS video player

LICENSE=	GPLv3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libclutter-1.0.so:graphics/clutter \
		libclutter-gst-3.0.so:multimedia/clutter-gst3 \
		libclutter-gtk-1.0.so:graphics/clutter-gtk3 \
		libgee-0.8.so:devel/libgee \
		libgranite.so:x11-toolkits/granite
RUN_DEPENDS=	gnome-session>0:x11/gnome-session \
		xfce4-tumbler>0:deskutils/xfce4-tumbler \
		open-sans>0:x11-fonts/open-sans

USES=		desktop-file-utils gettext gnome meson pkgconfig xorg
USE_GITHUB=	yes
GH_ACCOUNT=	elementary
USE_GNOME=	cairo gdkpixbuf2 glib20 gtk30
GLIB_SCHEMAS=	io.elementary.videos.gschema.xml
INSTALLS_ICONS=	yes
USE_GSTREAMER1=	yes core bad
USE_XORG=	x11

.include <bsd.port.mk>
