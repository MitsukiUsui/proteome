#!/home/mitsuki/.pyenv/versions/anaconda3-4.2.0/bin/python

import sys
from Bio import SeqIO

def main(inFilepath,outFilepath):
	with open(outFilepath, 'w') as f:
		for seq_record in SeqIO.parse(inFilepath, "fasta"):
			if seq_record.id[:3]=="ref" or seq_record.id[:2]=="gb" or seq_record.id[:2]=="gi":
				pass	
			else:
				if seq_record.id[:3]!='Con':
					print("\tAtypical: "+seq_record.id)#may need manual curation
				header=">CON|"+seq_record.id
				f.write(header+'\n')
				f.write(str(seq_record.seq)+'\n')

if __name__=="__main__":
	main(sys.argv[1],sys.argv[2])
