# downloads some useful vim plugins
set -o nounset
set -o errexit

# pathogen the mother of plugin management
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -LSso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

cd ~/.vim/bundle

# alternate plugin (header/implementation switcher)
if [ ! -d a.vim ]; then
    git clone https://github.com/vim-scripts/a.vim.git
fi

# fuzzy file finder
if [ ! -d command-t ]; then
    git clone git://git.wincent.com/command-t.git
    cd ~/.vim/bundle/command-t/ruby/command-t
    ruby extconf.rb
    make -j4
fi
