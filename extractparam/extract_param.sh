#!/bin/sh

IFS=$'\n'
catalog="../pickdatasets/pnnl_downloads.csv"
for line in `tail -n +2 ${catalog}`
do
	organism=`echo ${line} | cut -d ',' -f 1`
	dataset=`echo ${line} | cut -d ',' -f 3`
	filepath=~/data/pnnl/massive.ucsd.edu/result/${organism}/${dataset}_msgfplus.mzid
	outDir=~/out/altorf/proteome/param/${organism}/
	mkdir -p ${outDir}
	outFilepath=${outDir}${dataset}.param
	
	if [ -e ${outFilepath} ]; 
	then
		echo "SKIP: "${outFilepath}
	else
		./extract_param.py ${filepath}>${outFilepath}
		echo "DONE: "${outFilepath}
	fi
	
done

