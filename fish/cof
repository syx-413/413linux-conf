if status is-interactive
    # Commands to run in interactive sessions can go here 
    set -gx PATH $PATH /home/s413/.local/bin
    alias get_idf='. $HOME/.espressif/esp-idf/export.fish'
    set -Ux RUSTUP_DIST_SERVER "https://rsproxy.cn"
    set -Ux RUSTUP_UPDATE_ROOT "https://rsproxy.cn/rustup"
    starship init fish | source
end
