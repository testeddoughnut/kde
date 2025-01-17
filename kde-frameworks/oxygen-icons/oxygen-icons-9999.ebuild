# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_ORG_NAME="oxygen-icons5"
PVCUT=$(ver_cut 1-2)
QTMIN=5.12.3
inherit cmake-utils kde.org

DESCRIPTION="Oxygen SVG icon theme"
LICENSE="LGPL-3"
KEYWORDS=""
IUSE="test"

BDEPEND="
	>=dev-qt/qtcore-${QTMIN}:5
	>=kde-frameworks/extra-cmake-modules-${PVCUT}:5
	test? ( app-misc/fdupes )
"
DEPEND="test? ( dev-qt/qttest:5 )"

RESTRICT+=" !test? ( test )"

src_prepare() {
	cmake-utils_src_prepare
	use test || cmake_comment_add_subdirectory autotests
}
