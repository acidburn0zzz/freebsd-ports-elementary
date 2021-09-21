PORTNAME=	greeter
PORTVERSION=	6.0.0
CATEGORIES=	x11
PKGNAMEPREFIX=	elementary-

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	LightDM greeter for the Elementary desktop

LICENSE=	GPLv3+
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libaccountsservice.so:sysutils/accountsservice \
		liblightdm-gobject-1.so:x11/lightdm \
		libmutter-7.so:x11-wm/mutter \
		libgee-0.8.so:devel/libgee \
		libhandy-1.so:x11-toolkits/libhandy
RUN_DEPENDS=	gnome-settings-daemon>0:sysutils/gnome-settings-daemon \
		gnome-session>0:x11/gnome-session \
		gsettings-desktop-schemas>0:devel/gsettings-desktop-schemas \
		elementary-wallpapers>0:x11-themes/elementary-wallpapers \
		elementary-settings>0:sysutils/elementary-settings

USES=		elementary gettext gnome meson pkgconfig \
		python:3.6+,build xorg
USE_GNOME=	glib20 gtk30 cairo gdkpixbuf2
USE_ELEMENTARY=	granite wingpanel
USE_XORG=	x11

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

#MESON_ARGS=	-Dubuntu-patched-gsd=false

post-patch:
	@${REINPLACE_CMD} -i "" -e 's|%%PREFIX%%|${LOCALBASE}|g' \
		${WRKSRC}/src/Widgets/BackgroundImage.vala \
		${WRKSRC}/data/io.elementary.greeter.conf

#	@${MV} ${WRKSRC}/data/io.elementary.greeter.conf \
#		${WRKSRC}/data/io.elementary.greeter.conf.sample

.include <bsd.port.mk>
