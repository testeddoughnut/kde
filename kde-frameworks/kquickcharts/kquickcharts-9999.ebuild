# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ECM_EXAMPLES="true"
ECM_QTHELP="false"
ECM_TEST="true"
QTMIN=5.12.3
VIRTUALX_REQUIRED="test"
inherit ecm kde.org

DESCRIPTION="QtQuick plugin providing high-performance charts"
HOMEPAGE="https://cgit.kde.org/kquickcharts.git"

LICENSE="LGPL-2+"
KEYWORDS=""
IUSE=""

DEPEND="
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DBUILD_EXAMPLES=$(usex examples)
	)

	ecm_src_configure
}
