#!/usr/bin/env python

import sys

#round bvals to the nearest 50

with open(sys.argv[1]) as f:
    lines=f.readlines()
    line=lines[0].strip()
    vals=line.split()
    for v in vals:
        i=int(50*round(float(v)/50))
        sys.stdout.write(str(i))
        sys.stdout.write(" ")
