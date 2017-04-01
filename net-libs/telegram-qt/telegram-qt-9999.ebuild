# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils multibuild git-r3

DESCRIPTION="Telegram binding for Qt"
HOMEPAGE="https://projects.kde.org/projects/playground/network/telegram-qt/repository"
EGIT_REPO_URI="git://anongit.kde.org/telegram-qt"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug +qt4 qt5 test"

REQUIRE_USE="|| ( qt4 qt5 )"

RDEPEND="
	qt4? (
		dev-qt/qtcore:4
	)
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtnetwork:5
	)
	dev-libs/openssl
	sys-libs/zlib
"

DEPEND="
	$REPEND
	qt4? (
		test? (
			dev-qt/qtgui:4
		)
	)
	qt5? (
		test? (
			dev-qt/qtgui:5
			dev-qt/qtwidgets:5
		)
	)
"

pkg_setup() {
	MULTIBUILD_VARIANTS=( $(usev qt4) $(usev qt5) )
}

src_configure() {
	myconfigure() {
		local mycmakeargs=(
			$(cmake-utils_use_enable debug DEBUG_OUTPUT)
			$(cmake-utils_use_enable test TESTS)
			-DENABLE_EXAMPLES=OFF
		)
		if [[ ${MULTIBUILD_VARIANT} = qt4 ]]; then
			mycmakeargs+=(-DDESIRED_QT_VERSION=4)
		fi
		if [[ ${MULTIBUILD_VARIANT} = qt5 ]]; then
			mycmakeargs+=(-DDESIRED_QT_VERSION=5)
		fi
		cmake-utils_src_configure
	}

	multibuild_foreach_variant myconfigure
}

src_compile() {
	multibuild_foreach_variant cmake-utils_src_compile
}

#src_test() {
#        mytest() {
#                pushd "${BUILD_DIR}" > /dev/null
#                VIRTUALX_COMMAND="ctest -E '(CallChannel)'" virtualmake || die "tests failed"
#                popd > /dev/null
#        }
#
#        multibuild_foreach_variant mytest
#}

src_install() {
	multibuild_foreach_variant cmake-utils_src_install
}
