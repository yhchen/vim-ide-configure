#!/bin/sh


# check ${1} command exist.
# return 0 if exists. otherwise return none zero.
function command_exist()
{
	which ${1} > /dev/null 2>&1
	if [ ${?} == 0 ]; then
		echo -n 0;
	else
		echo -n 1;
	fi
}


# init ${SUDO} for super user permission
# warming : this command require you enter password
function require_sudo()
{
	if [[ -z "${SUDO}" || ${1} -eq 1 ]]; then
		echo "please enter your password:"
		read _passwd_
		SUDO="eval echo ${_passwd_} | sudo -S "
	fi;
}


# get install command
function get_install_cmd()
{
	if [ `command_exist yum` == 0 ]; then
		echo yum -y ;
	elif [ `command_exist apt-get` == 0 ]; then
		echo apt-get;
	else
		echo err_not_found;
	fi
}

# clean install temporary files
function autoclean_install()
{
	if [[ `command_exist yum` = 0 ]]; then
		echo "clean up system";
		${SUDO} yum clean all;
	elif [[ `command_exist apt-get` = 0 ]]; then
		echo "clean up system";
		${SUDO} apt-get autoclean;
		${SUDO} apt-get clean;
		${SUDO} apt-get autoremove;
		${SUDO} apt-get remove tracker;
		${SUDO} rm -rf /var/cache/apt/archives;
		${SUDO} rm -rf /var/cache/apt/archives/partial;
	fi
}

