awk -F, 'NR>1{print $1}' ../createcatalog/pnnl_downloads.csv|sort|uniq|awk '{print "wget -P ~/data/pnnl -x -r ftp://MSV000079053:a@massive.ucsd.edu/sequence/"$1}'>download_sequence.sh
chmod 744 download_sequence.sh
