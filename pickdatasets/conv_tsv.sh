IFS=$'\n'
for line in `tail -n +2 sampled_pnnl_datasets.csv`
#for line in `tail -n +2 head_sampled_pnnl_datasets.csv`
do
	organism=`echo ${line}|cut -d, -f 1`
	dataset=`echo ${line}|cut -d, -f 3`
	
	#dir=/home/mitsuki/out/altorf/proteome/result/
	dir=/tmp/massive.ucsd.edu/result/

	mzidFilepath=${dir}${organism}/${dataset}_msgfplus.mzid
	tsvFilepath=${dir}${organism}/${dataset}_msgfplus.tsv
	
	JARNAME="/home/mitsuki/software/msgf/MSGFPlus.jar"
	java -Xmx3500M -cp ${JARNAME} edu.ucsd.msjava.ui.MzIDToTsv -i ${mzidFilepath} -o ${tsvFilepath} -showDecoy 1 -unroll 0
done
