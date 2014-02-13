home=${HOME}
source=i3config.tar.gz

(
	cd /tmp
	curl -s -L -o ${source} http://github.com/hayzer/i3config/tarball/master
	tar zxf ${source}
	cd hayzer-*/
	mkdir -p ${home}/.i3

	if test ${I3WORK-}; then
		mkdir -p ${home}/bin
		cp dot-i3-config-work     ${home}/.i3/config
		cp dot-i3status.conf-work ${home}/.i3status.conf
		cp work-i3status.sh       ${home}/bin
	else
		cp dot-i3-config     ${home}/.i3/config
		cp dot-i3status.conf ${home}/.i3status.conf
	fi
	cp dot-xdefaults ${home}/.Xdefaults
	cd -
	rm -fr hayzer-*/ ${source}
)


