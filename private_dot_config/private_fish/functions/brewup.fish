function brewup --description 'Update brew, upgrade packages, and cleanup'
    brew update && brew upgrade && brew cleanup
end
