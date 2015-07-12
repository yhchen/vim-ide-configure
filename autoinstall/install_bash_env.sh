#!/bin/bash

source "./common_bash_func.sh"
require_sudo

_pwd_=`pwd`
_install_vim_="vim vim-common vim-filesystem vim-gnome "
#_install_mysql_="mysql-client libmysqlclient-dev mysql-server "
_install_sys_tools_="htop zerofree subversion uuid-dev "
_install_dev_="libreadline-dev gcc gcc-g++ ctags gdb cgdb build-essential libxml2-dev "
_install_input_="ibus ibus-pinyin "
#_install_dev2_="linux-headers-$(uname -r) gtkorphan gnome-system-tools"
_install_all_="${_install_vim_} ${_install_dev_} ${_install_input_} ${_install_sys_tools_} ${_install_mysql_} ${_install_dev2_} "


_install_cmd_=`get_install_cmd`
${SUDO} ${_install_cmd_} install ${_install_all_}
echo "fix libxml2 header";
${SUDO} cp -r /usr/include/libxml2/libxml /usr/include/;

# auto clean install cache
autoclean_install


