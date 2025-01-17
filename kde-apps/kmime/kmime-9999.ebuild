# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ECM_TEST="true"
KFMIN=5.64.0
inherit ecm kde.org

DESCRIPTION="Libary for handling mail messages and newsgroup articles"

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS=""
IUSE=""

DEPEND="
	>=kde-frameworks/kcodecs-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
"
RDEPEND="${DEPEND}
	!kde-apps/kdepim-l10n
"
