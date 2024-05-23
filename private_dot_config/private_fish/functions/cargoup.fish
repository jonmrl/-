function cargoup --description 'Update cargo binaries.'
    set executables eza zoxide zellij
    set -l error_occurred 0

    for exec in $executables
        echo "Checking if $exec needs an update..."

        set installed_version (cargo install --list | grep -E "^$exec " | awk '{print $2}' | sed 's/v//; s/://')
        set latest_version (cargo search $exec --limit 1 | grep -E "^$exec " | awk '{print $3}' | tr -d '"')

        if test -z "$installed_version"
            echo "$exec is not installed. Installing..."
            if cargo install $exec
                echo "$exec installed successfully."
            else
                echo "Error installing $exec." >&2
                set error_occurred 1
            end
        else if test "$installed_version" = "$latest_version"
            echo "$exec is already at the latest version ($latest_version). Skipping update."
        else
            echo "Updating $exec from version $installed_version to $latest_version..."
            if cargo install $exec --force
                echo "$exec updated successfully."
            else
                echo "Error updating $exec." >&2
                set error_occurred 1
            end
        end
    end

    if test $error_occurred -eq 0
        echo "All cargo binaries updated successfully!"
    else
        echo "Updating finished with some errors." >&2
    end
end
