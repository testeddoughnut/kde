# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KFMIN=5.64.0
inherit ecm kde.org

DESCRIPTION="KWallet extension for signond"
HOMEPAGE="https://01.org/gsso/"

SLOT="5"
KEYWORDS=""
LICENSE="GPL-2+"

DEPEND="
	>=kde-frameworks/kwallet-${KFMIN}:5
	net-libs/signond
"
RDEPEND="${DEPEND}"
