# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KFMIN=5.64.0
PVCUT=$(ver_cut 1-3)
inherit cmake-utils kde.org

DESCRIPTION="Breeze theme for Plymouth"

LICENSE="GPL-2+ GPL-3+"
SLOT="5"
KEYWORDS=""
IUSE=""

BDEPEND=">=kde-frameworks/extra-cmake-modules-${KFMIN}:5"
DEPEND="sys-boot/plymouth"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DDISTRO_NAME="Gentoo Linux"
		-DDISTRO_VERSION=
	)

	cmake-utils_src_configure
}
