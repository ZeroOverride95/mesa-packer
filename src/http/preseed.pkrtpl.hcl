# Package selection
d-i pkgsel/include string kali-linux-default kali-desktop-xfce

# User information
d-i passwd/user-fullname string ${fullname}
d-i passwd/username string ${username}
d-i passwd/user-password password ${password}
d-i passwd/user-password-again password ${password}

# Change default hostname
d-i netcfg/get_hostname string ${hostname}
d-i netcfg/get_domain string ${domain}

# Install OpenSSH server
d-i pkgsel/include string openssh-server
d-i preseed/late_command string \
    in-target update-rc.d ssh enable ; \
    echo "%${username} ALL=(ALL:ALL) NOPASSWD:ALL" > /
    target/etc/sudoers.d/${username} && chmod 0440 /
    target/etc/sudoers.d/${username}

# Region Information
d-i time/zone string US/Eastern
d-i debian-installer/locale string en_US
d-i debian-installer/language string en
d-i debian-installer/country string US
d-i debian-installer/locale string en_US.UTF-8
d-i keyboard-configuration/xkb-keymap select us

# Hard drive
d-i grub-installer/bootdev string /dev/sda

tasksel tasksel/first multiselect standard
d-i mirror/country string enter information manually
d-i mirror/suite string kali-rolling
d-i mirror/codename string kali-rolling
d-i mirror/http/hostname string http.kali.org
d-i mirror/http/directory string /kali
d-i mirror/http/proxy string
d-i partman-auto/method string regular
d-i partman-auto-lvm/guided_size string max
d-i partman-auto/choose_recipe select atomic
d-i partman-partitioning/confirm_write_new_label boolean true
d-i partman/choose_partition select finish
d-i partman/confirm boolean true
d-i partman/confirm_nooverwrite boolean true
d-i partman-md/confirm boolean true
d-i partman-partitioning/confirm_write_new_label boolean true
d-i partman/choose_partition select finish
d-i partman/confirm boolean true
d-i partman/confirm_nooverwrite boolean true
d-i grub-installer/only_debian boolean true
d-i grub-installer/with_other_os boolean true
d-i finish-install/reboot_in_progress note
d-i apt-setup/non-free boolean true
d-i apt-setup/contrib boolean true
d-i apt-setup/disable-cdrom-entries boolean true
# d-i apt-setup/security_host string security.kali.org/kali-security
d-i apt-setup/services-select multiselect
# d-i apt-setup/services-select multiselect security
d-i apt-setup/use_mirror boolean true

d-i pkgsel/upgrade select full-upgrade
d-i passwd/root-login boolean false
d-i preseed/early_command string anna-install eatmydata-udeb
d-i pkgsel/update-policy select none
popularity-contest popularity-contest/participate boolean false
encfs encfs/security-information boolean true
encfs encfs/security-information seen true
console-setup console-setup/charmap47 select UTF-8
samba-common samba-common/dhcp boolean false
macchanger macchanger/automatically_run boolean false
kismet-capture-common kismet-capture-common/install-users string
kismet-capture-common kismet-capture-common/install-setuid boolean true
wireshark-common wireshark-common/install-setuid boolean true
sslh sslh/inetd_or_standalone select standalone
atftpd atftpd/use_inetd boolean false
