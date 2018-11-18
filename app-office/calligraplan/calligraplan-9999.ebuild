# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

if [[ ${KDE_BUILD_TYPE} == release ]]; then
	SRC_URI="mirror://kde/stable/${PN}/${PN}-${PV}.tar.xz"
	KEYWORDS="~amd64 ~x86"
fi

KDE_HANDBOOK="forceoptional"
KDE_TEST="forceoptional"
inherit kde5

DESCRIPTION="Project management application"
HOMEPAGE="https://www.calligra.org/"

LICENSE="GPL-2"
IUSE="activities dbus +holidays pim X"

# FIXME: Disabled by upstream for good reason
# Crashes plan (https://bugs.kde.org/show_bug.cgi?id=311940)
# $(add_kdeapps_dep akonadi)
# $(add_kdeapps_dep akonadi-contacts)
# Currently upstream-disabled in plan
# =dev-libs/kproperty-3.0*:5
# =dev-libs/kreport-3.0*:5
DEPEND="
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kemoticons)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep khtml)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemmodels)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwallet)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	$(add_qt_dep designer)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	dev-lang/perl
	dev-libs/kdiagram:5
	sys-libs/zlib
	activities? ( $(add_frameworks_dep kactivities) )
	dbus? ( $(add_qt_dep qtdbus) )
	holidays? ( $(add_frameworks_dep kholidays) )
	pim? (
		$(add_kdeapps_dep kcalcore)
		$(add_kdeapps_dep kcontacts)
	)
	X? (
		$(add_qt_dep qtx11extras)
		x11-libs/libX11
	)
"
RDEPEND="${DEPEND}
	!app-office/calligra[calligra_features_plan(-)]
	!app-office/calligra-l10n:4
"
RESTRICT+=" test"

src_prepare() {
	kde5_src_prepare
	# Unconditionally disable deprecated deps
	punt_bogus_dep Qt5 OpenGL
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package activities KF5Activities)
		$(cmake-utils_use_find_package dbus Qt5DBus)
		$(cmake-utils_use_find_package holidays KF5Holidays)
		$(cmake-utils_use_find_package pim KF5CalendarCore)
		$(cmake-utils_use_find_package pim KF5Contacts)
	)

	kde5_src_configure
}