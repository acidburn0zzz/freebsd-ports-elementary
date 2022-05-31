PORTNAME=	elementary-session
PORTVERSION=	6.0.0
CATEGORIES=	x11-wm
DIST_SUBDIR=	elementary

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Session component for elementary OS

LICENSE=	GPLv2

# Background daemons
RUN_DEPENDS=	io.elementary.notifications:deskutils/elementary-notifications \
		io.elementary.shortcut-overlay:deskutils/shortcut-overlay \
		elementary-agent-geoclue2>0:net/elementary-agent-geoclue2 \
		elementary-agent-polkit>0:sysutils/elementary-agent-polkit \
		io.elementary.settings-daemon:sysutils/elementary-settings-daemon \
		xdg-user-dirs-gtk-update:devel/xdg-user-dirs-gtk \
		desktop-file-install:devel/desktop-file-utils

# Standalone applications
RUN_DEPENDS+=	io.elementary.tasks:deskutils/elementary-tasks \
		io.elementary.code:editors/elementary-code \
		io.elementary.photos:graphics/elementary-photos \
		io.elementary.calculator:math/elementary-calculator \
		io.elementary.greeter-compositor:x11/elementary-greeter \
		io.elementary.terminal:x11/elementary-terminal \
		io.elementary.screenshot:x11/elementary-screenshot \
		io.elementary.files:x11-fm/elementary-files \
		io.elementary.calendar:deskutils/elementary-calendar \
		io.elementary.music:audio/elementary-music \
		io.elementary.mail:mail/elementary-mail \
		io.elementary.videos:multimedia/elementary-videos

# Switchboard plugins
RUN_DEPENDS+=	switchboard-plug-notifications>0:deskutils/switchboard-plug-notifications \
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

MESON_ARGS=	-Dfallback-session="gnome" \
		-Ddetect-program-prefixes=true

OPTIONS_DEFINE=	EXAMPLES FULL
OPTIONS_SUB=	yes

EXAMPLES_SUB_FILES=	pkg-message xinitrc xprofile

FULL_DESC=	Install additional applications
FULL_RUN_DEPENDS=	io.elementary.mail:mail/elementary-mail \
			io.elementary.camera:multimedia/elementary-camera \
			switchboard-plug-a11y>0:accessibility/switchboard-plug-a11y
FULL_SUB_FILES=		30_org.onboard.gschema.override

post-patch:
	@${REINPLACE_CMD} -e "s|%%PORTVERSION%%|'${PORTVERSION}'|" \
		${WRKSRC}/meson.build

pre-install-EXAMPLES-on:
	${MKDIR} ${STAGEDIR}${EXAMPLESDIR}

pre-install-FULL-on:
	${MKDIR} ${STAGEDIR}${PREFIX}/share/glib-2.0/schemas

post-install-EXAMPLES-on:
	${INSTALL_DATA} ${FILESDIR}/plank.desktop \
		${STAGEDIR}${EXAMPLESDIR}
.for f in xinitrc xprofile
	${INSTALL_SCRIPT} ${WRKDIR}/${f} ${STAGEDIR}${EXAMPLESDIR}
.endfor

post-install-FULL-on:
	${INSTALL_DATA} ${WRKDIR}/30_org.onboard.gschema.override \
		${STAGEDIR}${PREFIX}/share/glib-2.0/schemas/

.include <bsd.port.mk>
