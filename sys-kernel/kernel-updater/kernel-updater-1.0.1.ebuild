# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python3_{4,5,6} )
DISTUTILS_SINGLE_IMPL="true"

inherit distutils-r1

DESCRIPTION="Python script to build and install gentoo-sources kernel"
HOMEPAGE="https://github.com/mederel/kernel-updater"
SRC_URI="https://github.com/mederel/kernel-updater/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}"
#    dev-python/setuptools[${PYTHON_USEDEP}]"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
