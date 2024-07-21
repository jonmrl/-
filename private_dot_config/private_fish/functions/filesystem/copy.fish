function copy --description 'Store paths in virtual buffer'
    set -g ENNUI_BUFFER
    for target in $argv
        set -a ENNUI_BUFFER (realpath $target)
    end
end
