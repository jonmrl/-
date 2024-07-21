function move --description 'Move buffered files to destination'
    set -q argv[1]; or set argv[1] .
    mv $ENNUI_BUFFER $argv[1]
end
