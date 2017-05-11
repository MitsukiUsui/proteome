SPECIES=${1}
IFS=$'\n'
LST="/grid1/mitsuki/gradwork/tmp/PNNL/download/"${SPECIES}"/filename.list"
ARRAY=($(cat ${LST}))

INDIR="/grid1/mitsuki/PNNL/massive.ucsd.edu/MSV000079053/result/"
OUTDIR="/grid1/mitsuki/gradwork/tmp/PNNL/param/"

for NAME in ${ARRAY[@]}
do
    INNAME=${INDIR}${SPECIES}"/"${NAME}"_msgfplus.mzid"
    OUTNAME=${OUTDIR}${SPECIES}"/"${NAME}"_msgfplus.param"
    
    echo ${INNAME}
    echo ${OUTNAME}
    python extract_parameter_mzid.py ${INNAME} > ${OUTNAME}

done
