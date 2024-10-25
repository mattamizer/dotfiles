# git
git config --global alias.amend 'commit --amend --reuse-message HEAD'
git config --global alias.changed 'diff --name-only origin/main..HEAD'
git config --global alias.changelog 'log --no-merges --pretty=format:"%s (%an)"'
git config --global alias.contributors 'shortlog --summary --email --numbered'
git config --global alias.edit "'!vim $(git ls-files -m) -p'"
git config --global alias.graph 'log --all --date=relative --decorate --graph --oneline'
git config --global alias.ignore '!gitignoreio() { curl https://www.gitignore.io/api/$@ ;}; gitignoreio'
git config --global alias.yolo 'push --force --no-verify'
git config --global alias.co 'checkout'
git config --global alias.cob 'checkout -b'
git config --global alias.it 'fetch --all --prune --tags --recurse-submodules'
git config --global merge.tool diffconflicts
git config --global mergetool.diffconflicts.cmd "vim -c DiffConflicts '$MERGED' '$BASE' '$LOCAL' '$REMOTE'"
git config --global mergetool.diffconflicts.trustExitCode true
git config --global mergetool.keepBackup false
git config --global color.ui true
git config --global core.editor "nvim"
git config --global core.excludesfile "$HOME/.gitignore"
git config --global github.user "mattamizer"
git config --global help.autocorrect 25
git config --global pull.ff only
git config --global push.default current
git config --global user.email "matthew.morrissey@protonmail.com"
git config --global user.name "Matthew Morrissey"
git config --global web.browser open
git config --global credential.helper osxkeychain
