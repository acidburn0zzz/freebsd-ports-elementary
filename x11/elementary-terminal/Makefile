# Created by: Dmitry Marakasov <amdmi3@FreeBSD.org>
# $FreeBSD$

PORTNAME=	terminal
PORTVERSION=	5.5.2
CATEGORIES=	x11
PKGNAMEPREFIX=	elementary-

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Lightweight, beautiful, and simple terminal from Elementary OS

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libgee-0.8.so:devel/libgee
RUN_DEPENDS=	dbus-send:devel/dbus

USES=		desktop-file-utils elementary gettext gnome meson \
		pkgconfig python:3.5+,build

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

USE_GNOME=	cairo gdkpixbuf2 pango glib20 gtk30 vte3
USE_ELEMENTARY=	granite

SUB_FILES=	pkg-message
MESON_ARGS=	-Dubuntu-bionic-patched-vte=false

GLIB_SCHEMAS=	io.elementary.terminal.gschema.xml

post-patch:
	@${REINPLACE_CMD} -e 's|/proc|/compat/linux/proc|' \
		${WRKSRC}/src/Widgets/TerminalWidget.vala

.include <bsd.port.mk>
