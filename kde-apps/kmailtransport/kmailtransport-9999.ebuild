# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ECM_TEST="true"
PVCUT=$(ver_cut 1-3)
KFMIN=5.64.0
QTMIN=5.12.3
inherit ecm kde.org

DESCRIPTION="Mail transport service"

LICENSE="LGPL-2.1+"
SLOT="5"
KEYWORDS=""
IUSE=""

COMMON_DEPEND="
	>=kde-frameworks/kcmutils-${KFMIN}:5
	>=kde-frameworks/kcompletion-${KFMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kconfigwidgets-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kio-${KFMIN}:5
	>=kde-frameworks/kwallet-${KFMIN}:5
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:5
	>=kde-apps/akonadi-${PVCUT}:5
	>=kde-apps/akonadi-mime-${PVCUT}:5
	>=kde-apps/kmime-${PVCUT}:5
	>=kde-apps/ksmtp-${PVCUT}:5
	>=kde-apps/libkgapi-${PVCUT}:5
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
"
DEPEND="${COMMON_DEPEND}
	test? ( >=kde-frameworks/ktextwidgets-${KFMIN}:5 )
"
RDEPEND="${COMMON_DEPEND}
	!kde-apps/kdepim-l10n
	!kde-apps/kdepimlibs:4
"

RESTRICT+=" test"
