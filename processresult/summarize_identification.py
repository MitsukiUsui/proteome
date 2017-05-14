import pandas as pd
from collections import Counter
import sys

def judge_origin(protein):
    if protein[:3].upper()=='REF' or protein[:2]=="gb" or protein[:2]=="gi":
        return 'REF'
    elif protein[:3]=="XXX":
        return "XXX"
    else:
        return "CON"

def main(outFilepath):
    filename="/home/mitsuki/altorf/proteome/createcatalog/pnnl_downloads.csv"
    #filename="/home/mitsuki/altorf/proteome/createcatalog/head_pnnl_downloads.csv"
    catalogDf=pd.read_csv(filename)

    dct_lst=[]
    for key, row in catalogDf.iterrows():
        org=row["Organism"]
        data=row["Dataset"]

        #define filepath for all fastaType
        fastaType_lst=["msgfplus","annotated"]
        dir_lst=["/home/mitsuki/data/pnnl/massive.ucsd.edu/result/"+org+"/",
                 "/home/mitsuki/out/altorf/proteome/result/"+org+"/"]
        filepath_lst=(dir_lst[0]+data+"_msgfplus.tsv",
                      dir_lst[1]+data+"_annotated.tsv")

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
            dct["REF"]=counter_lst[i]["REF"]
            dct["CON"]=counter_lst[i]["CON"]
            dct["XXX"]=counter_lst[i]["XXX"]
            dct_lst.append(dct)

        print("DONE "+org+'/'+data)
        
    outDf=pd.DataFrame(dct_lst)
    outDf=outDf[["Organism","Dataset","fasta_type","REF","CON","XXX"]]
    outDf.to_csv(outFilepath, index=False)
    
    
if __name__=="__main__":
    main(sys.argv[1])
