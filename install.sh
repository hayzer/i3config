source=i3config.tar.gz

function msg () {
   echo \* $1
}


(
    if test ! -e ${HOME}/.i3/config.BCK -a -e ${HOME}/.i3/config; then
        msg "Backup old environment"
        cp ${HOME}/.Xdefaults{,.BCK}
        cp ${HOME}/.i3status.conf{,.BCK}
        cp ${HOME}/.i3/config{,.BCK}
    fi
	cd /tmp &>/dev/null
	msg "Download last version"
	curl -s -L -o ${source} http://github.com/hayzer/i3config/tarball/master
	msg "Open the archive"
	tar zxf ${source}
	cd hayzer-*/
	mkdir -p ${HOME}/.i3

	if test ${I3WORK-}; then
	    msg "Setup work configuration"
		mkdir -p ${HOME}/bin
		cp dot-i3-config-work     ${HOME}/.i3/config
		cp dot-i3status.conf-work ${HOME}/.i3status.conf
		cp work-i3status.sh       ${HOME}/bin
	else
	    msg "Setup home configuration"
		cp dot-i3-config     ${HOME}/.i3/config
		cp dot-i3status.conf ${HOME}/.i3status.conf
	fi
	cp dot-xdefaults ${HOME}/.Xdefaults
	cd - &>/dev/null
	msg "Delete artifacts"
	rm -fr hayzer-*/ ${source}
)


