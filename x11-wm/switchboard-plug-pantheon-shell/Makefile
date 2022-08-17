PORTNAME=	switchboard-plug-pantheon-shell
PORTVERSION=	6.3.0
CATEGORIES=	x11-wm

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Switchboard desktop plugin

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libgexiv2.so:graphics/gexiv2 \
		libaccountsservice.so:sysutils/accountsservice \
		libtumbler-1.so:deskutils/xfce4-tumbler \
		libhandy-1.so:x11-toolkits/libhandy
RUN_DEPENDS=	contractor:sysutils/contractor \
		elementary-theme>=6.0.0:x11-themes/elementary-theme \
		elementary-wallpapers>0:x11-themes/elementary-wallpapers \
		opendyslexic-fonts-otf>0:x11-fonts/opendyslexic-fonts-otf

USES=		elementary gettext gnome meson pkgconfig
USE_GNOME=	glib20 gtk30 gnomedesktop3 librsvg2 gdkpixbuf2
USE_ELEMENTARY=	granite plank switchboard wingpanel

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

.include <bsd.port.mk>
