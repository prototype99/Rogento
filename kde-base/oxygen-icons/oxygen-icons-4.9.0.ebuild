# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Exp $

EAPI=4

if [[ ${PV} == *9999 ]]; then
        KMNAME="kdesupport"
else
        # Upstream does not ship releases properly so we dont want all versions
        MY_PV="4.9.0"
        MY_P="${PN}-${MY_PV}"
fi
KDE_REQUIRED="never"
inherit kde4-base

DESCRIPTION="Oxygen SVG icon theme."
HOMEPAGE="http://www.oxygen-icons.org/"
[[ ${PV} == *9999 ]] || \
SRC_URI="
        !bindist? ( http://dev.gentoo.org/~dilfridge/distfiles/${MY_P}.repacked.tar.xz )
        bindist? ( ${SRC_URI//${PV}/${MY_PV}} )
"
SLREV=1
SRC_URI="${SRC_URI} http://pkg2.rogentos.ro/~noxis/distro/${CATEGORY}/fdo-icons-rogentos${SLREV}.tar.gz"

LICENSE="LGPL-3"
KEYWORDS="~amd64 ~x86 ~arm ~amd64-linux ~x86-linux"
IUSE="aqua bindist"

DEPEND=""
RDEPEND="${DEPEND}"

[[ ${PV} == *9999 ]] || S=${WORKDIR}/${MY_P}

src_prepare() {
        kde4-base_src_prepare
        cp -r "${WORKDIR}"/fdo-icons-rogentos/* "${S}" || die
        # cp -r ../fdo-icons-rogentos/* ../${P} || die
}
