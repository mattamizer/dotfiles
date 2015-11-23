#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH="/Users/matthew.morrissey/.rvm/gems/ruby-2.1.5/bin:/Users/matthew.morrissey/.rvm/gems/ruby-2.1.5@global/bin:/Users/matthew.morrissey/.rvm/rubies/ruby-2.1.5/bin:/usr/local/bin:.git/safe/../../bin:/Users/matthew.morrissey/.bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/Users/matthew.morrissey/.rvm/bin"
export GOPATH=$HOME/gocode
export PATH=$PATH:$GOPATH/bin

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

branch() { git checkout ${1:-$(git branch | grep -v "^* "| pick)} ;}
code() { cd ~/Code; cd ${1:-$(ls -at ~/code | pick)} ;}
gocode() {
  cd $GOPATH/src/${1:-$(
  find $GOPATH/src -type d -maxdepth 3 | \
    grep "src/.*/.*/.*$" | \
    cut -f 7-9 -d "/" | \
    pick
  )}
}
