function tcd --description 'Create and cd into a temp directory'
    set -l temp_dir (mktemp -d -p $HOME)
    if test $status -eq 0
        cd $temp_dir
        and echo "Created and changed to temp directory: $temp_dir"
    else
        echo "Failed to create temp directory"
        return 1
    end
end
