IFS=$'\n'
for line in `tail -n +2 ../createcatalog/pnnl_downloads.csv`
#for line in `tail -n +2 ../createcatalog/head_pnnl_downloads.csv`
do
	organism=`echo ${line}|cut -d, -f 1`
	dataset=`echo ${line}|cut -d, -f 3`
	echo ${organism}
	echo ${dataset}

	mzidFilepath=/home/mitsuki/out/altorf/proteome/result/${organism}/${dataset}_annotated.mzid
	paramDir=/home/mitsuki/out/altorf/proteome/param/${organism}/
	myParamFilepath=${paramDir}${dataset}_annotated.param
	../extractparam/extract_param.py ${mzidFilepath}>${myParamFilepath}
	paramFilepath=${paramDir}${dataset}.param
	diff -q ${myParamFilepath} ${paramFilepath} 
done
