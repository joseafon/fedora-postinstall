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


curl -o /etc/yum.repos.d/skype-stable.repo https://repo.skype.com/rpm/stable/skype-stable.repo
dnf -y install skypeforlinux

dnf -y install fedora-workstation-repositories
dnf config-manager --set-enabled google-chrome
dnf -y install google-chrome-stable

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

wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo

dnf -y update

dnf -y install binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers kernel-devel dkms qt5-qtx11extras libxkbcommon

dnf -y install VirtualBox

usermod -a -G vboxusers $USER

clear
echo
echo "Por favor no olvide de instalar el Oracle_VM_VirtualBox_Extension_Pack"

sleep 3

echo "Reiniciando el sistema para aplicar los cambios"

sleep 3

reboot
