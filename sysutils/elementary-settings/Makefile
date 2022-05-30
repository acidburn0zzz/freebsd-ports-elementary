PORTNAME=	settings
PORTVERSION=	6.0.2
CATEGORIES=	sysutils
PKGNAMEPREFIX=	elementary-

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Default settings designed for elementary OS

DISABLE_LICENSES=	yes

LIB_DEPENDS=	libaccountsservice.so:sysutils/accountsservice
RUN_DEPENDS=	gnome-icons-elementary>0:x11-themes/gnome-icons-elementary \
		elementary-theme>0:x11-themes/elementary-theme \
		elementary-sound-theme>0:audio/elementary-sound-theme \
		elementary-wallpapers>0:x11-themes/elementary-wallpapers \
		open-sans>=0:x11-fonts/open-sans \
		roboto-fonts-ttf>0:x11-fonts/roboto-fonts-ttf

USES=		elementary gnome meson pkgconfig python:3.6+,build
USE_GNOME=	glib20

USE_GITHUB=	yes
GH_ACCOUNT=	elementary
GH_PROJECT=	default-settings

MESON_ARGS=	-Dappcenter-flatpak=false \
		-Ddefault-wallpaper=${LOCALBASE}/share/backgrounds/elementaryos-default

BINARY_ALIAS=	python3=${PYTHON_CMD}

GLIB_SCHEMAS=	20_net.launchpad.plank-dockitems.gschema.override \
		25_io.elementary.default-settings.gschema.override

post-extract:
	${CP} ${FILESDIR}/create-symlink.py ${WRKSRC}/meson/

.for f in io.elementary.appcenter.dockitem org.gnome.Epiphany.dockitem
	@${RM} ${WRKSRC}/skel/plank/dock1/launchers/${f}
.endfor

post-patch:
	${FIND} ${WRKSRC}/skel/plank/dock1/launchers -type f \
		| ${XARGS} ${REINPLACE_CMD} -i "" -e 's|/usr|${LOCALBASE}|'

.include <bsd.port.mk>
