# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ECM_TEST="forceoptional"
PVCUT=$(ver_cut 1-2)
QTMIN=5.12.3
VIRTUALX_REQUIRED="test"
inherit ecm kde.org

DESCRIPTION="Framework for searching and managing metadata"
LICENSE="LGPL-2+"
KEYWORDS=""
IUSE=""

DEPEND="
	>=kde-frameworks/kconfig-${PVCUT}:5
	>=kde-frameworks/kcoreaddons-${PVCUT}:5
	>=kde-frameworks/kcrash-${PVCUT}:5
	>=kde-frameworks/kdbusaddons-${PVCUT}:5
	>=kde-frameworks/kfilemetadata-${PVCUT}:5
	>=kde-frameworks/ki18n-${PVCUT}:5
	>=kde-frameworks/kidletime-${PVCUT}:5
	>=kde-frameworks/kio-${PVCUT}:5
	>=kde-frameworks/solid-${PVCUT}:5
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=dev-db/lmdb-0.9.17
"
RDEPEND="${DEPEND}
	!kde-frameworks/baloo:4[-minimal(+)]
"

RESTRICT+=" test" # bug 624250
