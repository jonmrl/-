function pasteln --description 'Create symlinks to buffered files'
    set -q argv[1]; or set arg[1] .
    ln -s $ENNUI_BUFFER $argv[1]
end
