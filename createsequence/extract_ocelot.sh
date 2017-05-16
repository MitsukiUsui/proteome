org_arr=`awk -F, 'NR>1{print $1}' ../pickdatasets/pnnl_downloads.csv|sort|uniq`

for organism in ${org_arr[@]}
do
	base=`awk -v "o=${organism}" -F, '$3==o{print $6}' ../createcatalog/pnnl_lookup.csv`
	inFilepath=/home/mitsuki/data/refseq/cds_from_genomic/${base}_cds_from_genomic.fna
	outFilepath=/home/mitsuki/out/altorf/proteome/sequence/${organism}/${base}.ocelot

	echo "IN  :"${inFilepath}
	echo "OUT :"${outFilepath}
	./extract_ocelot.py ${inFilepath} ${outFilepath}
done
