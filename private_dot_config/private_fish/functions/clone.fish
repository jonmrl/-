function clone --description 'a better git clone'
    set -q NEXUS; or set NEXUS $HOME/Nexus

    if test (count $argv) -eq 0
        echo >&2 "clone: Expected repo as argument."
        return 1
    end

    set --local giturl $argv[1]
    set --local user ''
    set --local repo ''

    if string match -r "^git@.*:.*" $giturl
        set --local user_repo (string split ':' (string split '@' $giturl)[2])
        set --local user_repo_parts (string split '/' $user_repo[2])
        set user $user_repo_parts[1]
        set repo (string split '.git' $user_repo_parts[2])[1]
    else if string match -r "^https://.*" $giturl
        set --local parts (string split '/' $giturl)
        set user $parts[-2]
        set repo (string split '.git' $parts[-1])[1]
    else if test (count $parts) -eq 1
        set user romnoj
        set repo $parts[1]
        set giturl "git@github.com:romnoj/$repo"
    else if test (count $parts) -eq 2
        set user $parts[1]
        set repo $parts[2]
        set giturl "git@github.com:$user/$repo"
    else
        echo >&2 "clone: Invalid repository format."
        return 1
    end

    set --local destdir $NEXUS/$repo
    if not test -d destdir
        command git clone --recurse-submodules $giturl $destdir
    else
        echo "Directory already exists."
    end

    cd $destdir
end
