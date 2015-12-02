#!/usr/bin/env python2
import os, sys, subprocess

fields = sys.stdin.read ().split ('\x00')

while len (fields) > 1:
    opath, atime = fields[0:2]
    fields = fields[2:]
    if not os.path.exists (opath):
        try:
            npath = subprocess.check_output (
                "locate -b -l 1 -e '/%s$'" % opath,
                shell = False
            )
        except:
            sys.stderr.write ("removing " + opath + "\n")
            npath = ""
        npath = npath[:-1]
        sys.stdout.write (opath + "\000" + npath + "\000")
    elif os.path.isdir (opath):
            sys.stdout.write (opath + "\000\000")

sys.stderr.write (sys.argv[0] + " done\n")
