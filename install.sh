set -o nounset

home=${HOME}
source=i3config.tar.gz

(
	cd /tmp
	curl -s -L -o ${source} http://github.com/hayzer/i3config/tarball/master
	tar zxvf ${source}
	cd hayzer-*/
	mkdir ${home}/.i3

	if ${I3WORK}; then
		cp dot-i3-config-work ${home}/.i3/config
		# I assume ~/bin is in PATH
		mkdir -p ${home}/bin
		cp work-i3status.sh ${home}/bin
	else
		cp dot-i3-config ${home}/.i3/config
	fi
	cp dot-i3status.conf ${home}/.i3status.conf
	rm -fr hayzer-*/ ${source}
)


