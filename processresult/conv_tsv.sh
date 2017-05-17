IFS=$'\n'
for line in `tail -n +2 ../pickdatasets/pnnl_downloads.csv`
#for line in `tail -n +2 ../pickdatasets/head_pnnl_downloads.csv`
do
	organism=`echo ${line}|cut -d, -f 1`
	dataset=`echo ${line}|cut -d, -f 3`
	
	dir=/home/mitsuki/data/pnnl/massive.ucsd.edu/result/
	mzidFilepath=${dir}${organism}/${dataset}_msgfplus.mzid
	tsvFilepath=${dir}${organism}/${dataset}_msgfplus.tsv
	
	JARNAME="/home/mitsuki/software/msgf/MSGFPlus.jar"
	java -Xmx3500M -cp ${JARNAME} edu.ucsd.msjava.ui.MzIDToTsv -i ${mzidFilepath} -o ${tsvFilepath} -showDecoy 1 -unroll 0
done
