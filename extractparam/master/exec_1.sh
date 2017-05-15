specFilepath=${1}
dataFilepath=${2}
mzidFilepath=${3}
tsvFilepath=${4}

JARNAME="/home/mitsuki/software/msgf/MSGFPlus.jar"
java -Xmx3500M -jar ${JARNAME} -s ${specFilepath} -d ${dataFilepath} -o ${mzidFilepath} \
	-t 20ppm \
	-ti -1,2 \
	-thread 8 \
	-tda 1 \
	-m 0 \
	-inst 1 \
	-e 1 \
	-protocol 5 \
	-ntt 1 \
	-mod /home/mitsuki/altorf/proteome/extractparam/master/Mods_1.txt \
	-minLength 6 \
	-maxLength 50 \
	-minCharge 2 \
	-maxCharge 5 \
	-n 1

java -Xmx3500M -cp ${JARNAME} edu.ucsd.msjava.ui.MzIDToTsv -i ${mzidFilepath} -o ${tsvFilepath} -showDecoy 1 -unroll 0
