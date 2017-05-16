org_arr=`awk -F, 'NR>1{print $1}' ../pickdatasets/pnnl_downloads.csv|sort|uniq`

for organism in ${org_arr[@]}
do
	base=`awk -v "o=${organism}" -F, '$3==o{print $6}' ../createcatalog/pnnl_lookup.csv`
	inFilepath=/home/mitsuki/data/refseq/genomic_fna/${base}_genomic.fna
	outFilepath=/home/mitsuki/out/altorf/proteome/sequence/${organism}/${base}.orf

	echo "IN  :"${inFilepath}
	echo "OUT :"${outFilepath}
	getorf -table 11 -find 0 -minsize 30 -sequence ${inFilepath} -outseq ${outFilepath}
done
