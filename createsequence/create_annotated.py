#!/home/mitsuki/.pyenv/versions/anaconda3-4.2.0/bin/python

import sys
import pandas as pd

def main(org, conFilepath, outFilepath):
    lookup_df=pd.read_csv("../createcatalog/pnnl_lookup.csv")
    taxId=int(lookup_df[lookup_df["dir_name"]==org]["tax_id"])
    assembly_df=pd.read_csv("/home/mitsuki/altorf/genome/speciespick/picked_assembly_summary.csv")
    row=assembly_df[assembly_df["taxid"]==taxId]
    cdsFilepath="/home/mitsuki/data/refseq/cds_from_genomic/"+str(row["ftp_basename"].iloc[0])+"_cds_from_genomic.fna"
    
    print("\tTarget : "+org+str(taxId))
    print("\tContami:"+conFilepath)
    print("\tCDSFile:"+cdsFilepath)
    print("\toutFile:"+outFilepath)


if __name__=="__main__":
    main(sys.argv[1], sys.argv[2], sys.argv[3])
