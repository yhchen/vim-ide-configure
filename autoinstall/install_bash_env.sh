#!/bin/bash

source "./common_bash_func.sh"
require_sudo

_pwd_=`pwd`
_install_vim_="vim vim-common vim-filesystem "
_install_dev_="libreadline-dev gcc gcc-g++ ctags "
_install_all_="${_install_vim_} ${_install_dev_}"


_install_cmd_=`get_install_cmd`
${SUDO} ${_install_cmd_} install ${_install_all_}


