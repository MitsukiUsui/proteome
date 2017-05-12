awk -F, 'NR>1{print "wget -P ~/data/pnnl -x ftp://MSV000079053:a@massive.ucsd.edu/peak/"$1"/"$3".mzML.gz"}' ../createcatalog/pnnl_downloads.csv > download_mzML.sh

awk -F, 'NR>1{print "wget -P ~/data/pnnl -x ftp://MSV000079053:a@massive.ucsd.edu/result/"$1"/"$3"_msgfplus.mzid.gz"}' ../createcatalog/pnnl_downloads.csv > download_mzid.sh

awk -F, 'NR>1{print $1}' ../createcatalog/pnnl_downloads.csv|sort|uniq|awk '{print "wget -P ~/data/pnnl -x -r ftp://MSV000079053:a@massive.ucsd.edu/sequence/"$1}'>download_sequence.sh

chmod 744 download_mzML.sh
chmod 744 download_mzid.sh
chmod 744 download_sequence.sh
