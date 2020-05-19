#########################################################################
#                                                                       #
#       Name of Script: fedora-postinstall                              #
#       Autor: Jose Manuel Afonso Santana                               #
#       Alias: joseafon                                                 #
#       Email: jmasantana@linuxmail.org                                 #
#                                                                       #
#########################################################################


#!/usr/bin/sh
clear

echo "
+-----------------------------------+
|                                   |
|        FEDORA-POSTINSTALL         |
|                                   |
+-----------------------------------+
"
sleep 2

dnf -y update

clear

dnf -y install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm system-config-language gstreamer1-{libav,plugins-{good,ugly,bad{-free,-nonfree}}} --setopt=strict=0

dnf -y install gstreamer1-{libav,plugins-{good,ugly,bad{-free,-nonfree}}} --setopt=strict=0

dnf -y install freshplayerplugin unrar p7zip p7zip-plugins java gimp pinta fotoxx
dnf -y install converseen cabextract transmageddon vlc dia keepassxc
dnf -y install soundconverter audacity-freeworld nano ntfs-3g qbittorrent gparted
dnf -y install tlp tlp-rdw firewall-config filezilla
dnf -y install thunderbird pdfmod deja-dup deja-dup-nautilus pitivi
dnf -y install libreoffice-langpack-es

dnf -y install balena-etcher-electron

curl -o /etc/yum.repos.d/skype-stable.repo https://repo.skype.com/rpm/stable/skype-stable.repo
dnf -y install skypeforlinux

dnf -y install fedora-workstation-repositories
dnf config-manager --set-enabled google-chrome
dnf -y install google-chrome-stable

wget https://balena.io/etcher/static/etcher-rpm.repo -O /etc/yum.repos.d/etcher-rpm.repo
dnf -y install balena-etcher-electron

clear

while :
do
clear

echo "Es este equipo un ordenador portatil? [s/n]"
read foo

	case $foo in
	s) clear
		tlp start
                 systemctl enable tlp
                 sleep 2
		 break
		;;

	n) clear
		break
		;;

	*) clear
		echo "Respuesta no valida"
		sleep 3
		;;
	esac

done

clear

dnf -y update

echo "Reiniciando el sistema para aplicar los cambios"

sleep 3

reboot
