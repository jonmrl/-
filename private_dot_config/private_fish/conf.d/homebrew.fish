#
# Initialize homebrew.

# Ensure homebrew exists.
set brewcmds (
    path filter \
         $HOME/.homebrew/bin/brew \
         $HOME/.linuxbrew/bin/brew \
         /opt/homebrew/bin/brew \
         /usr/local/bin/brew
    )
test (count $brewcmds) -gt 0 || return 1

# Setup cache storage location.
set brew_init $__fish_cache_dir/brew_init.fish

# Remove cached files older than four days.
find $__fish_cache_dir -depth 1 -type f -mtime +4 -delete &>/dev/null

if not test -r $brew_init
    mkdir -p (path dirname $brew_init)
    $brewcmds[1] shellenv >$brew_init
end

source $brew_init
