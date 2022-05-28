PORTNAME=	elementary-session
PORTVERSION=	6.0.0
CATEGORIES=	x11-wm
DIST_SUBDIR=	elementary

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Session for the Elementary desktop

LICENSE=	GPLv2

# Specifics to Elementary OS
RUN_DEPENDS=	io.elementary.notifications:deskutils/elementary-notifications \
		io.elementary.shortcut-overlay:deskutils/shortcut-overlay \
		elementary-agent-geoclue2>0:net/elementary-agent-geoclue2 \
		io.elementary.settings-daemon:sysutils/elementary-settings-daemon \
		xdg-user-dirs-gtk-update:devel/xdg-user-dirs-gtk \
		desktop-file-install:devel/desktop-file-utils \
		plank:x11/plank

# Standalone applications
RUN_DEPENDS+=	io.elementary.tasks:deskutils/elementary-tasks \
		io.elementary.code:editors/elementary-code \
		io.elementary.photos:graphics/elementary-photos \
		io.elementary.calculator:math/elementary-calculator \
		io.elementary.greeter-compositor:x11/elementary-greeter \
		io.elementary.terminal:x11/elementary-terminal \
		io.elementary.files:x11-fm/elementary-files \
		io.elementary.calendar:deskutils/elementary-calendar \
		io.elementary.music:audio/elementary-music \
		io.elementary.mail:mail/elementary-mail \
		io.elementary.videos:multimedia/elementary-videos

# Switchboard plugins
RUN_DEPENDS+=	switchboard-plug-a11y>0:accessibility/switchboard-plug-a11y \
		switchboard-plug-notifications>0:deskutils/switchboard-plug-notifications \
		switchboard-plug-about>0:sysutils/switchboard-plug-about \
		switchboard-plug-applications>0:x11/switchboard-plug-applications \
		switchboard-plug-display>0:x11/switchboard-plug-display \
		switchboard-plug-keyboard>0:x11/switchboard-plug-keyboard \
		switchboard-plug-mouse-touchpad>0:x11/switchboard-plug-mouse-touchpad \
		switchboard-plug-pantheon-shell>0:x11-wm/switchboard-plug-pantheon-shell

# Wingpanel plugins
RUN_DEPENDS+=	wingpanel-indicator-sound>0:audio/wingpanel-indicator-sound \
		wingpanel-indicator-notifications>0:deskutils/wingpanel-indicator-notifications \
		applications-menu>0:x11/applications-menu \
		wingpanel-indicator-keyboard>0:x11/wingpanel-indicator-keyboard \
		wingpanel-indicator-nightlight>0:x11/wingpanel-indicator-nightlight \
		wingpanel-indicator-datetime>0:x11-clocks/wingpanel-indicator-datetime \
		wingpanel-indicator-session>0:x11-wm/wingpanel-indicator-session

USES=		meson

USE_GITHUB=	yes
GH_ACCOUNT=	elementary
GH_PROJECT=	session-settings

MESON_ARGS=	-Dfallback-session="" \
		-Ddetect-program-prefixes=true

OPTIONS_DEFINE=	EXAMPLES FULL
OPTIONS_SUB=	yes

EXAMPLES_SUB_FILES=	pkg-message xprofile

FULL_DESC=	Install additional applications
FULL_RUN_DEPENDS=	io.elementary.camera:multimedia/elementary-camera \
			io.elementary.screenshot:x11/elementary-screenshot

post-patch:
	@${REINPLACE_CMD} -e "s|%%PORTVERSION%%|'${PORTVERSION}'|" \
		${WRKSRC}/meson.build

pre-install-EXAMPLES-on:
	${MKDIR} ${STAGEDIR}${EXAMPLESDIR}

post-install-EXAMPLES-on:
	${INSTALL_SCRIPT} ${WRKDIR}/xprofile ${STAGEDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
