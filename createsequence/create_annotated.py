#!/home/mitsuki/.pyenv/versions/anaconda3-4.2.0/bin/python

import sys
import pandas as pd
from Bio import SeqIO

def main(org, conFilepath, outFilepath):
	
	lookup_df=pd.read_csv("../createcatalog/pnnl_lookup.csv")
	taxId=int(lookup_df[lookup_df["dir_name"]==org]["tax_id"])
	assembly_df=pd.read_csv("/home/mitsuki/altorf/genome/speciespick/picked_assembly_summary.csv")
	row=assembly_df[assembly_df["taxid"]==taxId]
	proFilepath="/home/mitsuki/data/refseq/protein/"+str(row["ftp_basename"].iloc[0])+"_protein.faa"

	print("\ttarget  : "+org+", "+str(taxId))
	print("\tconFile :"+conFilepath)
	print("\tproFile :"+proFilepath)
	
	with open(outFilepath, 'w') as of:
		for seq_record in SeqIO.parse(conFilepath, "fasta"):
			of.write('>'+seq_record.id+'\n')
			of.write(str(seq_record.seq)+'\n')
		for seq_record in SeqIO.parse(proFilepath, "fasta"):
			header=">REF|"+seq_record.id
			of.write(header+'\n')
			of.write(str(seq_record.seq)+'\n')
	print("\tDONE outputing to "+outFilepath)


if __name__=="__main__":
	main(sys.argv[1], sys.argv[2], sys.argv[3])
