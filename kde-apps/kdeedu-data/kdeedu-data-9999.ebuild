# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde.org

DESCRIPTION="Shared icons, artwork and data files for educational applications"

LICENSE="GPL-2"
SLOT="5"
KEYWORDS=""
IUSE=""

BDEPEND="
	dev-qt/qtcore:5
	kde-frameworks/extra-cmake-modules:5
"
