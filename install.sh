home=${HOME}
source=i3config.tar.gz

(
	cd /tmp
	mkdir -p ${home}/.i3
	curl -s -L -o ${source} http://github.com/hayzer/i3config/tarball/master
	tar zxf ${source}
	cd hayzer-*/

	if test ${I3WORK-}; then
		cp dot-i3-config-work ${home}/.i3/config
		cp dot-i3status.conf-work ${home}/.i3status.conf
		# I assume ~/bin is in PATH
		mkdir -p ${home}/bin
		cp work-i3status.sh ${home}/bin
	else
		cp dot-i3-config ${home}/.i3/config
		cp dot-i3status.conf ${home}/.i3status.conf
	fi
	rm -fr hayzer-*/ ${source}
)


