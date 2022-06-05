PORTNAME=	gala
PORTVERSION=	6.3.1
CATEGORIES=	x11-wm

PATCH_SITES=	https://github.com/elementary/${PORTNAME}/commit/
PATCHFILES+=	1e223b3.patch:-p1 \
		e86a951.patch:-p1

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Window manager for elementary OS

LICENSE=	GPLv3

BUILD_DEPENDS=	valac:lang/vala \
		gnome-settings-daemon>0:sysutils/gnome-settings-daemon
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libmutter-10.so:x11-wm/mutter \
		libclutter-gtk-1.0.so:graphics/clutter-gtk3 \
		libbamf3.so:sysutils/bamf \
		libcanberra.so:audio/libcanberra \
		libcanberra-gtk3.so:audio/libcanberra-gtk3 \
		libgraphene-1.0.so:graphics/graphene \
		libgexiv2.so:graphics/gexiv2
RUN_DEPENDS=	gsettings-desktop-schemas>0:devel/gsettings-desktop-schemas \
		redacted-fonts-ttf>0:x11-fonts/redacted-fonts-ttf

USES=		elementary gettext gnome meson pkgconfig \
		python:3.6+,build xorg
USE_GNOME=	glib20 gtk30 gnomedesktop3 cairo gdkpixbuf2
USE_ELEMENTARY=	granite portals
USE_XORG=	xfixes

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

MESON_ARGS=	-Dsystemd=false

GLIB_SCHEMAS=	org.pantheon.desktop.gala.gschema.xml \
		20_elementary.pantheon.wm.gschema.override

post-patch:
# Force X11 backend
	${REINPLACE_CMD} -e "s|Exec=gala|Exec=gala --x11|" \
		${WRKSRC}/data/gala.desktop

	${FIND} ${WRKSRC}/data -type f -name '*.desktop' | \
		${XARGS} \
		${REINPLACE_CMD} -e "s|X-GNOME-HiddenUnderSystemd|#X-GNOME-HiddenUnderSystemd| ;\
		s|metacity|gala|g"

.include <bsd.port.mk>
