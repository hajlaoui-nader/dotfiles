echo "setting osx defaults"
####################
# [finder]
####################
# always open everything in Finder's list view
defaults write com.apple.Finder FXPreferredViewStyle Nlsv
# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

####################
# [launch]
####################

# disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false



####################
# [dock]
####################

# minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool false

