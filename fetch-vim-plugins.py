#!/bin/python
#
# downloads some useful vim plugins
# by Thomas Loockx
#

import os
import re
import subprocess 

auto_load_dir = os.path.expanduser("~/.vim/autoload")
pathogen_bundles_dir = os.path.expanduser("~/.vim/bundle")

if not os.path.exists(auto_load_dir):
    os.makedirs(auto_load_dir)
if not os.path.exists(pathogen_bundles_dir):
    os.makedirs(pathogen_bundles_dir)

# download & install Pathogen the mother of modern plugin management
os.system("curl -LSso %s https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim" % os.path.join(auto_load_dir, "pathogen.vim"))

if not os.path.exists(os.path.join(auto_load_dir, "pathogen.vim")):
    f = open(os.path.join(auto_load_dir, "pathogen.vim"), "wb")
    curl = pycurl.Curl()
    curl.setopt(pycurl.URL, "https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim")
    curl.setopt(pycurl.WRITEDATA, f)
    curl.perform()
    curl.close()
    f.close()

# list of repos where we fetch my other plugins - add new repos here
repositories = [ 'https://github.com/vim-scripts/a.vim.git' ,
                 'https://github.com/wincent/Command-T.git' ,
                 'https://github.com/godlygeek/tabular.git' ,
                 'https://github.com/majutsushi/tagbar.git' , ]

for repo in repositories:
    # extract the plugin's name from the URL 
    result = re.match(r"^.*\/(.*).git$", repo)
    if not result:
        continue
    bundle = result.group(1)
    dest = os.path.join(pathogen_bundles_dir, bundle)
    if os.path.isdir(os.path.join(pathogen_bundles_dir, bundle)):
        print("bundle %s already installed (%s)" % (bundle, dest))
    else:
        os.chdir(pathogen_bundles_dir)
        print("== Installing %s ==" % bundle)
        os.system("git clone %s" % repo)

        # Command-T requires extra love
        if bundle == "Command-T":
            os.chdir(os.path.join(pathogen_bundles_dir, "command-t/ruby/command-t"))
            subprocess.check_call(["ruby", "extconf.rb"])
            subprocess.check_call(["make", "-j4"])
