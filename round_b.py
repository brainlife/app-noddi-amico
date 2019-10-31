#!/usr/bin/env python

import json

config_file = open('config.json')
config = json.load(config_file)
bval_file = open(config['bvals'],"r")

bvals = bval_file.readline().replace(",", " ").split()
bval_file.close()

def round_b(b):
   return str(int(round(float(b)/100)*100))
o = open("./NODDI/dwi.bvals", "w")
o.write(" ".join(map(round_b, bvals)))
o.close()
