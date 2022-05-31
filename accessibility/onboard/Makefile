PORTNAME=	onboard
PORTVERSION=	1.4.1
CATEGORIES=	accessibility
MASTER_SITES=	https://launchpad.net/${PORTNAME}/${PORTVERSION:R}/${PORTVERSION}/+download/

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Simple on-screen keyboard

LICENSE=	GPLv3+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libhunspell-1.7.so:textproc/hunspell \
		libudev.so:devel/libudev-devd \
		libcanberra.so:audio/libcanberra \
		libcanberra-gtk3.so:audio/libcanberra-gtk3 \
		libcanberra.so:audio/libcanberra-gtk3 \
		libharfbuzz.so:print/harfbuzz
RUN_DEPENDS=	iso-codes>0:misc/iso-codes \
		${PYTHON_PKGNAMEPREFIX}python-distutils-extra>0:devel/py-python-distutils-extra@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}dbus>0:devel/py-dbus@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}cairo>0:graphics/py-cairo@${PY_FLAVOR}

USES=		gnome gettext pkgconfig python:3.6+ shebangfix xorg
USE_GNOME=	glib20 gtk30 pygobject3 gdkpixbuf2 cairo pango dconf
USE_PYTHON=	distutils noflavors
SHEBANG_GLOB=	*.py
SHEBANG_FILES=	Onboard/pypredict/tools/checkmodels
USE_XORG=	x11 xi xkbfile xtst

GLIB_SCHEMAS=	org.onboard.gschema.xml

post-patch:
	@${REINPLACE_CMD} -e 's|%%PREFIX%%|${LOCALBASE}|g' \
		${WRKSRC}/Onboard/Config.py \
		${WRKSRC}/Onboard/LanguageSupport.py \
		${WRKSRC}/Onboard/Indicator.py \
		${WRKSRC}/data/org.onboard.Onboard.service
# Avoid to pollute pkg-plist
	${FIND} ${WRKSRC} -type f -name '*.orig' | ${XARGS} rm

post-install:
	@${RM} ${STAGEDIR}${PREFIX}/share/glib-2.0/schemas/org.gnome.shell.extensions.onboard-indicator.gschema.xml
	${STRIP_CMD} ${STAGEDIR}${PYTHON_SITELIBDIR}/Onboard/pypredict/lm${PYTHON_EXT_SUFFIX}.so
	${STRIP_CMD} ${STAGEDIR}${PYTHON_SITELIBDIR}/Onboard/osk${PYTHON_EXT_SUFFIX}.so

.include <bsd.port.pre.mk>

PYDISTUTILS_INSTALLARGS=	-c -O1 --prefix=${PREFIX} --root=${STAGEDIR}

.include <bsd.port.post.mk>
