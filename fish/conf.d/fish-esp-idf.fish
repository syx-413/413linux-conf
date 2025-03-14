alias er='. $HOME/esp/esp-idf/export.fish'
alias ghcs="gh copilot suggest"
# Alias for 'gh copilot explain'
alias ghce="gh copilot explain"
alias vi nvim
alias pdf zathura
function ls
    command ls --color=auto -lah $argv
end
#set -gx IDF_TOOLS_PATH $HOME/.espressif/
if test -e /home/s413/export-esp.sh
    source /home/s413/export-esp.sh
end
