function check_ennui --description 'Check contents of virtual file buffer'
    if set -q ENNUI_BUFFER
        echo "ENNUI_BUFFER exists and contains: $ENNUI_BUFFER"
    else
        echo "ENNUI_BUFFER does not exist"
    end
end
