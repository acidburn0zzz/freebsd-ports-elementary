PORTNAME=	pantheon-tweaks
PORTVERSION=	1.0.1
CATEGORIES=	deskutils

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	System settings for the Elementary desktop

LICENSE=	GPLv3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee
RUN_DEPENDS=	elementary-theme>0:x11-themes/elementary-theme \
		gnome-icons-elementary>0:x11-themes/gnome-icons-elementary \
		elementary-sound-theme>0:audio/elementary-sound-theme \
		io.elementary.files:x11-fm/elementary-files \
		io.elementary.terminal:x11/elementary-terminal \
		io.elementary.videos:multimedia/elementary-videos

USES=		elementary gettext gnome meson pkgconfig \
		python:3.6+,build
USE_GNOME=	glib20 gtk30
USE_ELEMENTARY=	granite gala switchboard wingpanel

USE_GITHUB=	yes
GH_ACCOUNT=	${PORTNAME}

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' \
		${WRKSRC}/src/Settings/ThemeSettings.vala

.include <bsd.port.mk>
