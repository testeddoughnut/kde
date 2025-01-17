# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ECM_HANDBOOK="forceoptional"
inherit ecm kde.org

DESCRIPTION="Backup scheduler for KDE's Plasma desktop"
HOMEPAGE="https://www.linux-apps.com/p/1127689"

LICENSE="GPL-2"
SLOT="5"
KEYWORDS=""
IUSE=""

DEPEND="
	kde-frameworks/kcompletion:5
	kde-frameworks/kconfig:5
	kde-frameworks/kconfigwidgets:5
	kde-frameworks/kcoreaddons:5
	kde-frameworks/kdbusaddons:5
	kde-frameworks/ki18n:5
	kde-frameworks/kiconthemes:5
	kde-frameworks/kidletime:5
	kde-frameworks/kinit:5
	kde-frameworks/kio:5
	kde-frameworks/kjobwidgets:5
	kde-frameworks/knotifications:5
	kde-frameworks/kwidgetsaddons:5
	kde-frameworks/kxmlgui:5
	kde-frameworks/plasma:5
	kde-frameworks/solid:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtwidgets:5
	dev-libs/libgit2:=
"
RDEPEND="${DEPEND}
	dev-qt/qtdeclarative:5
	dev-qt/qtsvg:5
	app-backup/bup
	net-misc/rsync
"

src_configure() {
	local mycmakeargs=(
		-DUSE_SYSTEM_LIBGIT2=ON
	)
	ecm_src_configure
}
