dir=""
org_arr=`awk -F, 'NR>1{print $1}' ../createcatalog/pnnl_downloads.csv|sort|uniq`

for organism in ${org_arr[@]}
do
	inDir=/home/mitsuki/data/pnnl/massive.ucsd.edu/sequence/${organism}/
	outDir=/home/mitsuki/out/altorf/proteome/sequence/${organism}/
	mkdir -p ${outDir}

	file_arr=`ls ${inDir}*.fasta`	
	for inFilepath in ${file_arr[@]}
	do
		base=`basename ${inFilepath} .fasta`
		outFilepath=${outDir}${base}.contami
		echo "IN : ${inFilepath}"
		echo "OUT: ${outFilepath}"
		./extract_contami.py ${inFilepath} ${outFilepath}
	done
done
