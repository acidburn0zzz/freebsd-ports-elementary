# Created by: Olivier Duchateau
# $FreeBSD$

PORTNAME=	elementary-session
PORTVERSION=	5.0.4
CATEGORIES=	x11-wm
MASTER_SITES=	https://codeberg.org/olivierd/elementary-session/archive/
DISTNAME=	${PORTVERSION}
DIST_SUBDIR=	elementary

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Session for the Elementary desktop

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	elementary-settings>0:sysutils/elementary-settings \
		elementary-agent-geoclue2>0:net/elementary-agent-geoclue2 \
		applications-menu>0:x11/applications-menu \
		xdg-user-dirs-gtk-update:devel/xdg-user-dirs-gtk \
		gnome-keyring:security/gnome-keyring

# Official applications
RUN_DEPENDS+=	io.elementary.shortcut-overlay:deskutils/shortcut-overlay \
		io.elementary.calculator:math/pantheon-calculator \
		io.elementary.screenshot-tool:x11/elementary-screenshot \
		io.elementary.terminal:x11/elementary-terminal \
		io.elementary.files:x11-fm/elementary-files \

# Switchboard plugins
RUN_DEPENDS+=	switchboard-plug-a11y>0:accessibility/switchboard-plug-a11y \
		switchboard-plug-sound>0:audio/switchboard-plug-sound \
		switchboard-plug-notifications>0:deskutils/switchboard-plug-notifications \
		switchboard-plug-applications>0:x11/switchboard-plug-applications \
		switchboard-plug-display>0:x11/switchboard-plug-display \
		switchboard-plug-keyboard>0:x11/switchboard-plug-keyboard \
		switchboard-plug-mouse-touchpad>0:x11/switchboard-plug-mouse-touchpad \
		switchboard-plug-pantheon-shell>0:x11-wm/switchboard-plug-pantheon-shell

# Wingpanel plugins
RUN_DEPENDS+=	wingpanel-indicator-sound>0:audio/wingpanel-indicator-sound \
		wingpanel-indicator-notifications>0:deskutils/wingpanel-indicator-notifications \
		wingpanel-indicator-keyboard>0:x11/wingpanel-indicator-keyboard \
		wingpanel-indicator-nightlight>0:x11/wingpanel-indicator-nightlight \
		wingpanel-indicator-datetime>0:x11-clocks/wingpanel-indicator-datetime \
		wingpanel-indicator-session>0:x11-wm/wingpanel-indicator-session

USES=		meson

WRKSRC=		${WRKDIR}/${PORTNAME}

MESON_ARGS=	-Dfallback-session=""

OPTIONS_DEFINE=		APPEDITOR CLIPPED EPHEMERAL
OPTIONS_DEFAULT=	CLIPPED

APPEDITOR_DESC=		Application editor menu
CLIPPED_DESC=		Clipboard manager
EPHEMERAL_DESC=		Web browser using WebKit engine

APPEDITOR_RUN_DEPENDS=	com.github.donadigo.appeditor:x11/appeditor
CLIPPED_RUN_DEPENDS=	com.github.davidmhewitt.clipped:deskutils/clipped
EPHEMERAL_RUN_DEPENDS=	com.github.cassidyjames.ephemeral:www/ephemeral

.include <bsd.port.mk>
