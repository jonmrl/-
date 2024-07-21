function paste --description 'Copy buffered files to destination'
    set -q argv[1]; or set argv[1] .
    cp -R $ENNUI_BUFFER $argv[1]
end
