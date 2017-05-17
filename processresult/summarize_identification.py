import pandas as pd
from collections import Counter
import sys

    
def judge_origin(protein):
    def parse_identifier(identifier):
        assert len(identifier)==3
        if identifier.upper()=="REF" or identifier[:2]=="gb" or identifier[:2]=="gi":#not allways REF, when _msgfplus
            return "REF"
        elif identifier=="ORF":
            return "ORF"
        elif identifier=="OC1":
            return "OC1"
        elif identifier=="OC5":
            return "OC5"
        else:#not allways CON, when _msgfplus
            return "CON"
    
    if protein[:3]=="XXX":#is decoy
        return 'D'+parse_identifier(protein[4:7])
    else:
        return parse_identifier(protein[:3])

    
def main(outFilepath):
    catalogFilepath="/home/mitsuki/altorf/proteome/pickdatasets/pnnl_downloads.csv"
    #catalogFilepath="/home/mitsuki/altorf/proteome/pickdatasets/head_pnnl_downloads.csv"
    catalogDf=pd.read_csv(catalogFilepath)

    dct_lst=[]
    for key, row in catalogDf.iterrows():
        org=row["Organism"]
        data=row["Dataset"]

        #define filepath for all fastaType
        fastaType_lst=["msgfplus","annotated"]
        dir_lst=["/home/mitsuki/data/pnnl/massive.ucsd.edu/result/"+org,
                 "/home/mitsuki/out/altorf/proteome/result/"+org]
        filepath_lst=(dir_lst[0]+'/'+data+'_'+fastaType_lst[0]+".tsv",
                      dir_lst[1]+'/'+data+'_'+fastaType_lst[1]+".tsv")

        #summarize identification result in the form of Counter
        counter_lst=[]
        for filepath in filepath_lst:
            df=pd.read_csv(filepath,sep='\t')
            fdf=df[df["PepQValue"]<=0.05]#filter by peptide level FDR 0.05
            origin_lst=[judge_origin(i) for i in fdf["Protein"]]
            counter=Counter(origin_lst)
            counter_lst.append(counter)

        #udpate dct_lst with summary
        for i,fastaType in enumerate(fastaType_lst):
            dct={}
            dct["Organism"]=org
            dct["Dataset"]=data
            dct["fasta_type"]=fastaType
            
            origin_lst=["REF","DREF","CON","DCON"]
            for origin in origin_lst:
                dct[origin]=counter_lst[i][origin]
            dct_lst.append(dct)

        print("DONE: "+org+'/'+data)
        
    outDf=pd.DataFrame(dct_lst)
    outDf=outDf[["Organism","Dataset","fasta_type"]+origin_lst]
    outDf.to_csv(outFilepath, index=False)
    
    
if __name__=="__main__":
    main(sys.argv[1])
