dir=/home/mitsuki/out/altorf/proteome

IFS=$'\n'
for line in `tail -n +2 ../pickdatasets/pnnl_downloads.csv`
#for line in `tail -n +2 ../pickdatasets/head_pnnl_downloads.csv`
#for line in `cat fix.csv`
do
	organism=`echo ${line}|cut -d, -f 1`
	dataset=`echo ${line}|cut -d, -f 3`

	
	#configuration for custermized peptide identification
	paramNum=`awk -v "o=${organism}" -v "d=${dataset}" -F, '$1==o && $2==d{print $3}' ../extractparam/pnnl_param.csv`
	cmd=../extractparam/master/exec_${paramNum}.sh
	fastaName=`awk -v "o=${organism}" -v "d=${dataset}" -F, '$1==o && $2==d{print $3}' ../createsequence/pnnl_sequence_new.csv`
	#fastaType=annotated
	fastaType=${1}

	#define 4 filepath for MS-GF+
	specFilepath=/home/mitsuki/data/pnnl/massive.ucsd.edu/peak/${organism}/${dataset}.mzML
	dataFilepath=${dir}/sequence/${organism}/${fastaName}_${fastaType}.fasta
	mzidFilepath=${dir}/result/${organism}/${dataset}_${fastaType}.mzid
	tsvFilepath=${dir}/result/${organism}/${dataset}_${fastaType}.tsv
	mkdir -p ${dir}/result/${organism}

#	echo ${cmd}
#	echo ${specFilepath}
#	echo ${dataFilepath}
#	echo ${mzidFilepath}
#	echo ${tsvFilepath}


	if [ -e ${mzidFilepath} ];
	then
		echo "SKIP: "${mzidFilepath}
	else
		#define log filepath for UGE
		outlog=${dir}/log/${organism}/${dataset}_${fastaType}.sgeout
		errlog=${dir}/log/${organism}/${dataset}_${fastaType}.sgeerr

		mkdir -p ${dir}/log/${organism}
		if [ -e ${outlog} ];
		then
			rm outlog
			rm errlog
		fi

		qsub -S /bin/bash -q all.q -l mem_free=2G -pe make 10 -o ${outlog} -e ${errlog} \
			${cmd} ${specFilepath} ${dataFilepath} ${mzidFilepath} ${tsvFilepath}
	fi
done
