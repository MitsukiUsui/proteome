dir=/home/mitsuki/out/altorf/proteome/

IFS=$'\n'
for line in `cat ../createcatalog/pnnl_downloads.csv`
#for line in `cat ../createcatalog/head_pnnl_downloads.csv`
do
	organism=`echo ${line}|cut -d, -f 1`
	dataset=`echo ${line}|cut -d, -f 3`

	#get param num
	paramNum=`awk -v "o=${organism}" -v "d=${dataset}" -F, '$1==o && $2==d{print $3}' ../extractparam/pnnl_param.csv`
	cmd=${dir}param/exec_${paramNum}.sh
	
	#define 3 filepath for execution
	specFilepath=/home/mitsuki/data/pnnl/massive.ucsd.edu/peak/${organism}/${dataset}.mzML
	dataFilepath=`awk -v "o=${organism}" -v "d=${dataset}" -F, '$1==o && $2==d{print $3}' ../createsequence/pnnl_sequence.csv`
	outFilepath=${dir}result/${organism}/${dataset}_annotated.mzid
	mkdir -p ${dir}result/${organism}

	#submit to uge using qsub
	outlog=${dir}log/${organism}/${dataset}.sgeout
	errlog=${dir}log/${organism}/${dataset}.sgeerr
	mkdir -p ${dir}log/${organism}
	qsub -S /bin/bash -q all.q -l mem_free=2G -pe make 10 -o ${outlog} -e ${errlog} \
		${cmd} ${specFilepath} ${dataFilepath} ${outFilepath}
done
