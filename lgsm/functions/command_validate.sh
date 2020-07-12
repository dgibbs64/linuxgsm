#!/bin/bash
# LinuxGSM command_validate.sh function
# Author: Daniel Gibbs
# Website: https://linuxgsm.com
# Description: Runs a server validation.

fn_commandname(){
	commandname="VALIDATE"
	commandaction="Validating"
	functionselfname="$(basename "$(readlink -f "${BASH_SOURCE[0]}")")"
}
fn_commandname

fn_validate(){
	fn_print_warn "Validate might overwrite some customised files"
	fn_script_log_warn "${commandaction} server: Validate might overwrite some customised files"
	totalseconds=3
	for seconds in {3..1}; do
		fn_print_warn "Validate might overwrite some customised files: ${totalseconds}"
		totalseconds=$((totalseconds - 1))
		sleep 1
		if [ "${seconds}" == "0" ]; then
			break
		fi
	done
	fn_print_warn_nl "Validate might overwrite some customised files"

	fn_dl_steamcmd
}

fn_print_dots "SteamCMD"
check.sh
if [ "${status}" != "0" ]; then
	fn_print_stop_warning
	exitbypass=1
	command_stop.sh
	fn_commandname
	fn_validate
	exitbypass=1
	command_start.sh
	fn_commandname
else
	fn_validate
fi

core_exit.sh
