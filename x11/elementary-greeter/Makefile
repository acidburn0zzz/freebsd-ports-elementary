# Created by: Olivier Duchateau
# $FreeBSD$

PORTNAME=	greeter
PORTVERSION=	5.0.4
CATEGORIES=	x11
PKGNAMEPREFIX=	elementary-

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	LightDM greeter for the Elementary desktop

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libaccountsservice.so:sysutils/accountsservice \
		liblightdm-gobject-1.so:x11/lightdm \
		libmutter-6.so:x11-wm/mutter \
		libgee-0.8.so:devel/libgee
RUN_DEPENDS=	gnome-settings-daemon>=3.28:sysutils/gnome-settings-daemon \
		gsettings-desktop-schemas>=3.28:devel/gsettings-desktop-schemas \
		gnome-backgrounds>0:x11-themes/gnome-backgrounds

USES=		elementary gettext gnome meson pkgconfig \
		python:3.5+,build xorg
USE_GNOME=	glib20 gtk30 cairo gdkpixbuf2
USE_ELEMENTARY=	granite wingpanel
USE_XORG=	x11

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

MESON_ARGS=	-Dubuntu-patched-gsd=false

post-patch:
	@${REINPLACE_CMD} -i "" -e 's|%%PREFIX%%|${PREFIX}|g' \
		${WRKSRC}/src/Widgets/BackgroundImage.vala \
		${WRKSRC}/data/io.elementary.greeter.conf

	@${MV} ${WRKSRC}/data/io.elementary.greeter.conf \
		${WRKSRC}/data/io.elementary.greeter.conf.sample

.include <bsd.port.mk>
