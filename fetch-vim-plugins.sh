#!/bin/sh
#
# downloads some useful vim plugins
# by Thomas Loockx
#

set -o nounset
set -o errexit

# pathogen the mother of modern plugin management
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -LSso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
cd ~/.vim/bundle

# list of repos where we fetch my other plugins, add new repos here
REPOS='https://github.com/vim-scripts/a.vim.git
       git://git.wincent.com/command-t.git'

for REPO in $REPOS; do
    # extract the plugin's name from the URL 
    PLUGIN=`expr match "$REPO" '.*\/\(.*\).git'`
    # check if we already have the plugin
    if [ ! -d $PLUGIN ]; then
        echo "installing $PLUGIN -> downloading from repo $REPO"
        git clone $REPO
    else
        echo "skipping $PLUGIN -> already installed"
    fi
done

# fuzzy file finder requires some extra magic
if [ -d command-t ]; then
    cd ~/.vim/bundle/command-t/ruby/command-t
    ruby extconf.rb
    make -j4
fi
