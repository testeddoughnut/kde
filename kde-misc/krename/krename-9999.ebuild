# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ECM_TEST="true"
KFMIN=5.60.0
QTMIN=5.12.3
inherit ecm kde.org

DESCRIPTION="Powerful batch file renamer"
HOMEPAGE="https://kde.org/applications/utilities/org.kde.krename
https://userbase.kde.org/KRename"

LICENSE="GPL-2"
SLOT="5"
KEYWORDS=""
IUSE="exif office pdf taglib truetype"

BDEPEND="sys-devel/gettext"
DEPEND="
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=dev-qt/qtxml-${QTMIN}:5
	>=kde-frameworks/kcompletion-${KFMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/kcrash-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kiconthemes-${KFMIN}:5
	>=kde-frameworks/kio-${KFMIN}:5
	>=kde-frameworks/kitemviews-${KFMIN}:5
	>=kde-frameworks/kjobwidgets-${KFMIN}:5
	>=kde-frameworks/kjs-${KFMIN}:5
	>=kde-frameworks/kservice-${KFMIN}:5
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:5
	>=kde-frameworks/kxmlgui-${KFMIN}:5
	exif? ( media-gfx/exiv2:= )
	office? ( >=kde-frameworks/karchive-${KFMIN}:5 )
	pdf? ( app-text/podofo:= )
	taglib? ( media-libs/taglib )
	truetype? ( media-libs/freetype:2 )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake_use_find_package exif Exiv2)
		$(cmake_use_find_package office KF5Archive)
		$(cmake_use_find_package pdf PoDoFo)
		$(cmake_use_find_package taglib Taglib)
		$(cmake_use_find_package truetype Freetype)
	)

	ecm_src_configure
}
