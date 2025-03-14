# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_mihoro_global_optspecs
	string join \n m/mihoro-config= h/help V/version
end

function __fish_mihoro_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_mihoro_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_mihoro_using_subcommand
	set -l cmd (__fish_mihoro_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c mihoro -n "__fish_mihoro_needs_command" -s m -l mihoro-config -d 'Path to mihoro config file' -r
complete -c mihoro -n "__fish_mihoro_needs_command" -s h -l help -d 'Print help'
complete -c mihoro -n "__fish_mihoro_needs_command" -s V -l version -d 'Print version'
complete -c mihoro -n "__fish_mihoro_needs_command" -f -a "setup" -d 'Setup mihoro by downloading mihomo binary and remote config'
complete -c mihoro -n "__fish_mihoro_needs_command" -f -a "update" -d 'Update mihomo remote config and restart mihomo.service'
complete -c mihoro -n "__fish_mihoro_needs_command" -f -a "update-geodata" -d 'Update mihomo geodata'
complete -c mihoro -n "__fish_mihoro_needs_command" -f -a "apply" -d 'Apply mihomo config overrides and restart mihomo.service'
complete -c mihoro -n "__fish_mihoro_needs_command" -f -a "start" -d 'Start mihomo.service with systemctl'
complete -c mihoro -n "__fish_mihoro_needs_command" -f -a "status" -d 'Check mihomo.service status with systemctl'
complete -c mihoro -n "__fish_mihoro_needs_command" -f -a "stop" -d 'Stop mihomo.service with systemctl'
complete -c mihoro -n "__fish_mihoro_needs_command" -f -a "restart" -d 'Restart mihomo.service with systemctl'
complete -c mihoro -n "__fish_mihoro_needs_command" -f -a "log" -d 'Check mihomo.service logs with journalctl'
complete -c mihoro -n "__fish_mihoro_needs_command" -f -a "logs" -d 'Check mihomo.service logs with journalctl'
complete -c mihoro -n "__fish_mihoro_needs_command" -f -a "proxy" -d 'Output proxy export commands'
complete -c mihoro -n "__fish_mihoro_needs_command" -f -a "uninstall" -d 'Uninstall and remove mihoro and config'
complete -c mihoro -n "__fish_mihoro_needs_command" -f -a "completions" -d 'Generate shell completions for mihoro'
complete -c mihoro -n "__fish_mihoro_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c mihoro -n "__fish_mihoro_using_subcommand setup" -s h -l help -d 'Print help'
complete -c mihoro -n "__fish_mihoro_using_subcommand update" -s h -l help -d 'Print help'
complete -c mihoro -n "__fish_mihoro_using_subcommand update-geodata" -s h -l help -d 'Print help'
complete -c mihoro -n "__fish_mihoro_using_subcommand apply" -s h -l help -d 'Print help'
complete -c mihoro -n "__fish_mihoro_using_subcommand start" -s h -l help -d 'Print help'
complete -c mihoro -n "__fish_mihoro_using_subcommand status" -s h -l help -d 'Print help'
complete -c mihoro -n "__fish_mihoro_using_subcommand stop" -s h -l help -d 'Print help'
complete -c mihoro -n "__fish_mihoro_using_subcommand restart" -s h -l help -d 'Print help'
complete -c mihoro -n "__fish_mihoro_using_subcommand log" -s h -l help -d 'Print help'
complete -c mihoro -n "__fish_mihoro_using_subcommand logs" -s h -l help -d 'Print help'
complete -c mihoro -n "__fish_mihoro_using_subcommand proxy; and not __fish_seen_subcommand_from export export-lan unset help" -s h -l help -d 'Print help'
complete -c mihoro -n "__fish_mihoro_using_subcommand proxy; and not __fish_seen_subcommand_from export export-lan unset help" -f -a "export" -d 'Output and copy proxy export shell commands'
complete -c mihoro -n "__fish_mihoro_using_subcommand proxy; and not __fish_seen_subcommand_from export export-lan unset help" -f -a "export-lan" -d 'Output and copy proxy export shell commands for LAN access'
complete -c mihoro -n "__fish_mihoro_using_subcommand proxy; and not __fish_seen_subcommand_from export export-lan unset help" -f -a "unset" -d 'Output and copy proxy unset shell commands'
complete -c mihoro -n "__fish_mihoro_using_subcommand proxy; and not __fish_seen_subcommand_from export export-lan unset help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c mihoro -n "__fish_mihoro_using_subcommand proxy; and __fish_seen_subcommand_from export" -s h -l help -d 'Print help'
complete -c mihoro -n "__fish_mihoro_using_subcommand proxy; and __fish_seen_subcommand_from export-lan" -s h -l help -d 'Print help'
complete -c mihoro -n "__fish_mihoro_using_subcommand proxy; and __fish_seen_subcommand_from unset" -s h -l help -d 'Print help'
complete -c mihoro -n "__fish_mihoro_using_subcommand proxy; and __fish_seen_subcommand_from help" -f -a "export" -d 'Output and copy proxy export shell commands'
complete -c mihoro -n "__fish_mihoro_using_subcommand proxy; and __fish_seen_subcommand_from help" -f -a "export-lan" -d 'Output and copy proxy export shell commands for LAN access'
complete -c mihoro -n "__fish_mihoro_using_subcommand proxy; and __fish_seen_subcommand_from help" -f -a "unset" -d 'Output and copy proxy unset shell commands'
complete -c mihoro -n "__fish_mihoro_using_subcommand proxy; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c mihoro -n "__fish_mihoro_using_subcommand uninstall" -s h -l help -d 'Print help'
complete -c mihoro -n "__fish_mihoro_using_subcommand completions; and not __fish_seen_subcommand_from bash fish zsh help" -s h -l help -d 'Print help'
complete -c mihoro -n "__fish_mihoro_using_subcommand completions; and not __fish_seen_subcommand_from bash fish zsh help" -f -a "bash" -d 'Generate bash completions'
complete -c mihoro -n "__fish_mihoro_using_subcommand completions; and not __fish_seen_subcommand_from bash fish zsh help" -f -a "fish" -d 'Generate fish completions'
complete -c mihoro -n "__fish_mihoro_using_subcommand completions; and not __fish_seen_subcommand_from bash fish zsh help" -f -a "zsh" -d 'Generate zsh completions'
complete -c mihoro -n "__fish_mihoro_using_subcommand completions; and not __fish_seen_subcommand_from bash fish zsh help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c mihoro -n "__fish_mihoro_using_subcommand completions; and __fish_seen_subcommand_from bash" -s h -l help -d 'Print help'
complete -c mihoro -n "__fish_mihoro_using_subcommand completions; and __fish_seen_subcommand_from fish" -s h -l help -d 'Print help'
complete -c mihoro -n "__fish_mihoro_using_subcommand completions; and __fish_seen_subcommand_from zsh" -s h -l help -d 'Print help'
complete -c mihoro -n "__fish_mihoro_using_subcommand completions; and __fish_seen_subcommand_from help" -f -a "bash" -d 'Generate bash completions'
complete -c mihoro -n "__fish_mihoro_using_subcommand completions; and __fish_seen_subcommand_from help" -f -a "fish" -d 'Generate fish completions'
complete -c mihoro -n "__fish_mihoro_using_subcommand completions; and __fish_seen_subcommand_from help" -f -a "zsh" -d 'Generate zsh completions'
complete -c mihoro -n "__fish_mihoro_using_subcommand completions; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c mihoro -n "__fish_mihoro_using_subcommand help; and not __fish_seen_subcommand_from setup update update-geodata apply start status stop restart log proxy uninstall completions help" -f -a "setup" -d 'Setup mihoro by downloading mihomo binary and remote config'
complete -c mihoro -n "__fish_mihoro_using_subcommand help; and not __fish_seen_subcommand_from setup update update-geodata apply start status stop restart log proxy uninstall completions help" -f -a "update" -d 'Update mihomo remote config and restart mihomo.service'
complete -c mihoro -n "__fish_mihoro_using_subcommand help; and not __fish_seen_subcommand_from setup update update-geodata apply start status stop restart log proxy uninstall completions help" -f -a "update-geodata" -d 'Update mihomo geodata'
complete -c mihoro -n "__fish_mihoro_using_subcommand help; and not __fish_seen_subcommand_from setup update update-geodata apply start status stop restart log proxy uninstall completions help" -f -a "apply" -d 'Apply mihomo config overrides and restart mihomo.service'
complete -c mihoro -n "__fish_mihoro_using_subcommand help; and not __fish_seen_subcommand_from setup update update-geodata apply start status stop restart log proxy uninstall completions help" -f -a "start" -d 'Start mihomo.service with systemctl'
complete -c mihoro -n "__fish_mihoro_using_subcommand help; and not __fish_seen_subcommand_from setup update update-geodata apply start status stop restart log proxy uninstall completions help" -f -a "status" -d 'Check mihomo.service status with systemctl'
complete -c mihoro -n "__fish_mihoro_using_subcommand help; and not __fish_seen_subcommand_from setup update update-geodata apply start status stop restart log proxy uninstall completions help" -f -a "stop" -d 'Stop mihomo.service with systemctl'
complete -c mihoro -n "__fish_mihoro_using_subcommand help; and not __fish_seen_subcommand_from setup update update-geodata apply start status stop restart log proxy uninstall completions help" -f -a "restart" -d 'Restart mihomo.service with systemctl'
complete -c mihoro -n "__fish_mihoro_using_subcommand help; and not __fish_seen_subcommand_from setup update update-geodata apply start status stop restart log proxy uninstall completions help" -f -a "log" -d 'Check mihomo.service logs with journalctl'
complete -c mihoro -n "__fish_mihoro_using_subcommand help; and not __fish_seen_subcommand_from setup update update-geodata apply start status stop restart log proxy uninstall completions help" -f -a "proxy" -d 'Output proxy export commands'
complete -c mihoro -n "__fish_mihoro_using_subcommand help; and not __fish_seen_subcommand_from setup update update-geodata apply start status stop restart log proxy uninstall completions help" -f -a "uninstall" -d 'Uninstall and remove mihoro and config'
complete -c mihoro -n "__fish_mihoro_using_subcommand help; and not __fish_seen_subcommand_from setup update update-geodata apply start status stop restart log proxy uninstall completions help" -f -a "completions" -d 'Generate shell completions for mihoro'
complete -c mihoro -n "__fish_mihoro_using_subcommand help; and not __fish_seen_subcommand_from setup update update-geodata apply start status stop restart log proxy uninstall completions help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c mihoro -n "__fish_mihoro_using_subcommand help; and __fish_seen_subcommand_from proxy" -f -a "export" -d 'Output and copy proxy export shell commands'
complete -c mihoro -n "__fish_mihoro_using_subcommand help; and __fish_seen_subcommand_from proxy" -f -a "export-lan" -d 'Output and copy proxy export shell commands for LAN access'
complete -c mihoro -n "__fish_mihoro_using_subcommand help; and __fish_seen_subcommand_from proxy" -f -a "unset" -d 'Output and copy proxy unset shell commands'
complete -c mihoro -n "__fish_mihoro_using_subcommand help; and __fish_seen_subcommand_from completions" -f -a "bash" -d 'Generate bash completions'
complete -c mihoro -n "__fish_mihoro_using_subcommand help; and __fish_seen_subcommand_from completions" -f -a "fish" -d 'Generate fish completions'
complete -c mihoro -n "__fish_mihoro_using_subcommand help; and __fish_seen_subcommand_from completions" -f -a "zsh" -d 'Generate zsh completions'
