function brewup --description 'Update homebrew, upgrade installed packages, and cleanup.'
    brew update && brew upgrade && brew cleanup
end
