#!/home/mitsuki/.pyenv/versions/anaconda3-4.2.0/bin/python

import sys
from Bio import SeqIO

def is_typical(seq_record):
	if len(seq_record)>=6 and len(seq_record)%3==0:
		return True
	else:
		return False

def main(inFilepath, outFilepath):
	with open(outFilepath,'w') as f:
		totalCDS=0
		processedCDS=0
		for seq_record in SeqIO.parse(inFilepath, "fasta"):
			totalCDS+=1
			if is_typical(seq_record):
				processedCDS+=1
				ocelot1=seq_record.seq[2:len(seq_record)-1].translate(table=11)
				for i,subSeq in enumerate(ocelot1.split('*')):
					if len(subSeq)>=10:
						header=">OC1|"+seq_record.id
						f.write(header+'\n')
						f.write(str(subSeq)+'\n')

				ocelot5=seq_record.seq.reverse_complement().translate(table=11)
				for i,subSeq in enumerate(ocelot5.split('*')):
					if len(subSeq)>=10:
						header=">OC5|"+seq_record.id
						f.write(header+'\n')
						f.write(str(subSeq)+'\n')
	print("\tDONE: extraction from {0}/{1} CDSs".format(processedCDS, totalCDS))


if __name__=="__main__":
	main(sys.argv[1],sys.argv[2])
