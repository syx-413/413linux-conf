if status is-interactive
    set -x PATH "/home/s413/.rustup/toolchains/esp/xtensa-esp-elf/esp-14.2.0_20240906/xtensa-esp-elf/bin" $PATH
    set -x LIBCLANG_PATH "/home/s413/.rustup/toolchains/esp/xtensa-esp32-elf-clang/esp-18.1.2_20240912/esp-clang/lib"
    alias er='. $HOME/esp/esp-idf/export.fish'
    alias export_esp='. ~/export-esp.sh'
    # Commands to run in interactive sessions can go here
end
