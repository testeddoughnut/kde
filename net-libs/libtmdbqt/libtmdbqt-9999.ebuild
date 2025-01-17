# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils kde.org

DESCRIPTION="Qt library to query the movie database API (themoviedb.org)"
HOMEPAGE="https://cgit.kde.org/libtmdbqt.git"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE="test"

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtnetwork:5
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DTMDBQT_ENABLE_TESTS=$(usex test)
	)

	cmake-utils_src_configure
}
