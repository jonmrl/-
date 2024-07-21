function md --description 'Create directory and parents if needed'
    if test (count $argv) -eq 0
        echo "Usage: md <directory_name>"
        return 1
    end
    mkdir -p $argv
    and echo "Directory created: $argv"
    or echo "Filed to create directory: $argv"
end
