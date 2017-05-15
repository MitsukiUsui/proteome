ftpDir=ftp://MSV000079053:a@massive.ucsd.edu
dir=/home/mitsuki/data/pnnl/massive.ucsd.edu

IFS=$'\n'
#for line in `tail -n +2 ../createcatalog/pnnl_downloads.csv`
for line in `tail -n +2 ../createcatalog/head_pnnl_downloads.csv`
do
	organism=`echo ${line}|cut -d, -f 1`
	dataset=`echo ${line}|cut -d, -f 3`

	#Download mzid file
	outFilepath=${dir}/result/${organism}/${dataset}_msgfplus.mzid
	if [ -e ${outFilepath} ]; 
	then
		echo "SKIP: "${outFilepath}
	else 
		ftpFilepath=${ftpDir}/result/${organism}/${dataset}_msgfplus.mzid.gz
		outDir=${dir}/result/${organism}
		wget -P ${outDir} ${ftpFilepath}
		gunzip ${outDir}/${dataset}_msgfplus.mzid.gz
		echo "DONE: "${outFilepath}
	fi
	
	#Download mzML file
	outFilepath=${dir}/peak/${organism}/${dataset}.mzML
	if [ -e ${outFilepath} ]; 
	then
		echo "SKIP: "${outFilepath}
	else 
		ftpFilepath=${ftpDir}/peak/${organism}/${dataset}.mzML.gz
		outDir=${dir}/peak/${organism}
		wget -P ${outDir} ${ftpFilepath}
		gunzip ${outDir}/${dataset}.mzML.gz
		echo "DONE: "${outFilepath}
	fi
done
