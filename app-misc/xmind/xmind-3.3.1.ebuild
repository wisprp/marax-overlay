# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit java-pkg-2 java-ant-2 eutils

MY_PV="201212250029"
MY_PV2="${PV}.${MY_PV}"


DESCRIPTION=" XMind - Brainstorming and Mind Mapping XMind, is an open source brainstorming and mind mapping software tool developed by XMind Ltd. It helps people to capture ideas, organize to various charts, and share them for collaboration. Supporting mind maps, fishbone diagrams, tree diagrams, org-charts, logic charts, and even spreadsheets. Often used for knowledge management, meeting minutes, task management, and GTD. XMind is compatible with Freemind/Mindmanager."
HOMEPAGE="http://www.xmind.net/"
SRC_URI="x86? ( http://dl2.xmind.net/xmind-downloads/${PN}-linux-${MY_PV2}_i386.deb )
         amd64? ( http://dl2.xmind.net/xmind-downloads/${PN}-linux-${MY_PV2}_amd64.deb ) "
LICENSE="EPL,LGPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


DEPEND=">=x11-libs/gtk+-2.8.0
		>=virtual/jdk-1.5.0"
RDEPEND=">=virtual/jre-1.5.0"
src_unpack() {
if [ "${ARCH}" = "amd64" ] ; then
	unpack ${PN}-linux-${MY_PV2}_amd64.deb
else
	unpack ${PN}-linux-${MY_PV2}_i386.deb
fi


  	unpack ./data.tar.gz
}
src_compile () {
    chmod a+x usr/local/xmind/XMind
}
src_install()  {
	insinto /usr/local
	doins -r usr/local/xmind
	dosym /usr/local/xmind/XMind /usr/bin/xmind
	insinto /usr/share /applications
	doins   usr/share/applications/xmind.desktop
	insinto /usr/share/mime/packages
	doins  usr/share/mime/packages/xmind.xml


}
pkg_postinst() {
	chmod a+x /usr/local/xmind/XMind
}
