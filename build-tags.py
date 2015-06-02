#!/bin/python
#
# Builds a cscope and ctags database in the current directory.

import os
import subprocess
import tempfile
import time

# list of source file extensions
extensions = [ ".cpp", ".c", ".h", ".cu", ".ch" ]

# time execution
start_time = time.time()

print("building ctags and cscope files for directory '%s'" % (os.getcwd()))

# compile a list with all the source files
sources = []
for root, dirs, files in os.walk(os.getcwd()):
    for file in files:
        if os.path.splitext(file)[1] in extensions:
            sources.append(os.path.join(root, file))

# create a temp file with the file list (don't delete it, comes in handy when
# debugging stuff).
fd, tmp_path = tempfile.mkstemp("source_files.txt")
for source in sources:
    os.write(fd, source + "\n")

# create the ctags file
subprocess.check_call(["ctags", "-L", tmp_path])

# create the cscope
subprocess.check_call(["cscope", "-b", "-i", tmp_path])

print("built index files in %s seconds" % (time.time() - start_time))
