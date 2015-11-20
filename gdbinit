# ~/.gdbinit -- Thomas Loockx

# disable C++ overload resolution, it seems to make gdb more stable
set overload-resolution off
# make sure that we don't churn out a gazillion of completions
set max-completions 100
# I like pretty
set print pretty

# use the stl pretty printers that came with libstdcxx
python
import sys
sys.path.insert(0, '/usr/share/gcc-4.8/python')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end
