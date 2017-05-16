#!/home/mitsuki/.pyenv/versions/anaconda3-4.2.0/bin/python

import sys
import pandas as pd
from Bio import SeqIO

def main(annFilepath, oceFilepath, outFilepath, thres):
	with open(outFilepath, 'w') as of:
		for seq_record in SeqIO.parse(annFilepath, "fasta"):
			of.write('>'+seq_record.id+'\n')
			of.write(str(seq_record.seq)+'\n')
		for seq_record in SeqIO.parse(oceFilepath, "fasta"):
			if (len(seq_record)>=thres):
				of.write('>'+seq_record.id+'\n')
				of.write(str(seq_record.seq)+'\n')
	print("\tDONE outputing to "+outFilepath)

if __name__=="__main__":
	main(sys.argv[1], sys.argv[2], sys.argv[3], int(sys.argv[4]))
