set -o nounset

home=${HOME}
source=i3config.tar.gz

(
	cd /tmp
	curl -s -L -o ${source} http://github.com/hayzer/i3config/tarball/master
	tar zxvf ${source}
	cd hayzer-*/
	mkdir ${home}/tmp/.i3
	cp dot-i3-config ${home}/tmp/.i3/config
	cp dot-i3status.conf ${home}/tmp/.i3status.conf
	cd -
	rm -fr hayzer-*/ ${source}
)


