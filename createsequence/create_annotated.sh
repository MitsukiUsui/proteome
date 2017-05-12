dir=""
org_arr=`awk -F, 'NR>1{print $1}' ../createcatalog/pnnl_downloads.csv|sort|uniq`

for organism in ${org_arr[@]}
do
	dir=/home/mitsuki/out/altorf/proteome/sequence/${organism}/

	file_arr=`ls ${dir}*.contami`	
	for conFilepath in ${file_arr[@]}
	do
		base=`basename ${conFilepath} .contami`
		outFilepath=${dir}${base}_annotated.ffmsgf
		echo "ORGANISM : ${organism}"
		echo "CONTAMI  : ${conFilepath}"
		echo "OUTFILE  : ${outFilepath}" 
		./create_annotated.py ${organism} ${conFilepath} ${outFilepath}
	done
done
