org_arr=`awk -F, 'NR>1{print $1}' ../pickdatasets/pnnl_downloads.csv|sort|uniq`

for organism in ${org_arr[@]}
do
	dir=/home/mitsuki/out/altorf/proteome/sequence/${organism}
	file_arr=`ls ${dir}/*_annotated.fasta`
	for annFilepath in ${file_arr[@]}
	do
		thres_arr=("10" "166")
		for thres in ${thres_arr[@]}
			do
			base=`basename ${annFilepath} _annotated.fasta`
			orfFilepath=`ls ${dir}/*.orf`
			outFilepath=${dir}/${base}_allorf${thres}.fasta
			
			echo "ANNOTATED : "${annFilepath}
			echo "ORFFILE   : "${orfFilepath}
			echo "OUTFILE   : "${outFilepath}
			echo "THRES     : "${thres}
			./create_allorf.py ${annFilepath} ${orfFilepath} ${outFilepath} ${thres}
			done
	done
done
