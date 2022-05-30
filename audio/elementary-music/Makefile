PORTNAME=	music
PORTVERSION=	7.0.0
CATEGORIES=	audio
PKGNAMEPREFIX=	elementary-

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Music player designed for elementary OS

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	valac:lang/vala
USES=		elementary gettext gnome gstreamer meson pkgconfig
USE_GNOME=	glib20 gdkpixbuf2 gtk40
USE_ELEMENTARY=	granite7
USE_GSTREAMER=	libgstreamer plugins faad flac lame gdkpixbuf libav ogg \
		opus taglib vorbis

USE_GITHUB=	yes
GH_ACCOUNT=	elementary

GLIB_SCHEMAS=	io.elementary.music.gschema.xml

.include <bsd.port.mk>
