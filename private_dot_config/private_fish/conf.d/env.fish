#
# Set environment variables for fish shell

# XDG specified directories. Used by Linux, and (most) macOS CLI tools.
set -q XDG_CONFIG_HOME; or set -Ux XDG_CONFIG_HOME $HOME/.config
set -q XDG_CACHE_HOME; or set -Ux XDG_CACHE_HOME $HOME/.cache
set -q XDG_DATA_HOME; or set -Ux XDG_DATA_HOME $HOME/.local/share
set -q XDG_STATE_HOME; or set -Ux XDG_STATE_HOME $HOME/.local/state

# Create the XDG directories if they don't exist already
mkdir -p $XDG_CONFIG_HOME $XDG_DATA_HOME $XDG_STATE_HOME $XDG_CACHE_HOME

# Specify location for important Linux utilities
set -q GNUPGHOME; or set -Ux GNUPGHOME $XDG_DATA_HOME/gnupg
set -gx LESSHISTFILE $XDG_DATA_HOME/lesshst
set -gx SQLITE_HISTORY $XDG_DATA_HOME/sqlite_history

# Setup fish caching directory
set -q __fish_cache_dir; or set -Ux __fish_cache_dir $XDG_CACHE_HOME/fish
test -d $__fish_cache_dir; or mkdir -p $__fish_cache_dir

# Allow fish sub-directories for functions
set fish_function_path (path resolve $__fish_config_dir/functions/*/) $fish_function_path

# Nexus
set -gx NEXUS $HOME/Nexus
set -gx EDITOR hx
set -gx VISUAL zed

# Executable directories
set -q CARGO_HOME; or set -Ux CARGO_HOME $HOME/.cargo
set -q CARGO_BIN; or set -Ux CARGO_BIN $CARGO_HOME/bin
set -q PNPM_HOME; or set -Ux PNPM_HOME $XDG_DATA_HOME/pnpm
set -q RYE_HOME; or set -Ux RYE_HOME $XDG_CONFIG_HOME/rye

# Miscellaneous flags
set -gx HELIX_RUNTIME $XDG_CONFIG_HOME/helix/runtime
set -gx HOMEBREW_NO_ANALYTICS 1
set -gx RYE_NO_AUTO_INSTALL 1
set -gx BAT_THEME gruvbox-dark

#
# Initialize frequently used abbreviations

set -q ABBRS_INIT; and return

abbr -a -- fconf 'cd $__fish_config_dir'

abbr -a -- h history
abbr -a -- c clear
abbr -a -- cat bat
abbr -a -- ds cdh
abbr -a -- l 'eza --long --all --no-user --git --group-directories-first'
abbr -a -- lt 'eza --tree --level=3 --git-ignore'
abbr -a -- cargoup 'cargo install-update -ag'

# Git
abbr -a -- g git
abbr -a -- gi 'git init'
abbr -a -- gst 'git status'
abbr -a -- gsh 'git show'
abbr -a -- gd 'git diff --minimal'

abbr -a -- ga 'git add'
abbr -a -- gaa 'git add --all'

abbr -a -- gc 'git commit --verbose'
abbr -a -- gcm 'git commit --m'

abbr -a -- gu 'git pull'
abbr -a -- gp 'git push'
abbr -a -- gpf 'git push --force'

# Abbreviations should only initialize once
set -g ABBRS_INIT true

#
# Initialize zoxide

type -q zoxide || return 1

# Indicate cache storage location
set zoxide_init $__fish_cache_dir/zoxide_init.fish

# Remove cached files older than four days
find $__fish_cache_dir -depth 1 -type f -mtime +4 -delete &>/dev/null

# Cache zoxide init fish command
if not test -r $zoxide_init
    mkdir -p (path dirname $zoxide_init)
    zoxide init fish >$zoxide_init
end

source $zoxide_init
