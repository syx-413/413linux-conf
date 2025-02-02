if status is-interactive
    # Commands to run in interactive sessions can go here
    alias ghcs="gh copilot suggest"
    # Alias for 'gh copilot explain'
    alias ghce="gh copilot explain"
    alias vi nvim
end
if uwsm check may-start
    exec uwsm start hyprland.desktop
end
#if uwsm check may-start && uwsm select
#    exec systemd-cat -t uwsm_start uwsm start default
#end
