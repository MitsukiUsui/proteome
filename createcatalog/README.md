# createcatalog

## Summary
Organizes scattered information about the 112 species in [PNNL library](https://www.nature.com/articles/sdata201541?WT.mc_id=TWT_NJapan_SciData_1508).  


## Inputs
0. input.txt
    * copied text from SpeciesList section of [proteomeXchange](http://proteomecentral.proteomexchange.org/cgi/GetDataset?ID=PXD001860).

0. pnnlFilename.txt

    ```
    wget -v --output-file=logfile.txt --recursive --spider ftp://MSV000079053:a@massive.ucsd.edu/ccms_result/
    cat logfile.txt |grep exists > pnnlFilename.txt
    ```
    * in order to get directly name

## Outputs
### pnnl_lookup.csv
e.g)
|scientific_name|taxid|dir_name|genome_flag|domain|ftp_basename|
|:--|:--:|:--|:--:|:--|:--|
|Actinosynnema mirum DSM 43827|446462|Actinosynnema_mirum_DSM_43827|1|bacteria|GCF_000023245.1_ASM2324v1

* genome_flag (0/1): whether corresponding tax_id is included in [genome analysis](https://github.com/MitsukiUsui/genome)
* domain & ftp_basename is defined only on those species which genome_flag = 1, otherwise empty.


## Scripts
0. parse_proteomexchange.ipynb
    * parses input.txt and output(input.csv, temp file)
    * only 111/112 species were found.

0. get_directory_name.ipynb
    * adds dir_name column to input.csv
    * manual curation needed because of 111 problem.
    * after that renamed as pnnl_lookup.csv.

0. integrate_with_genome.ipynb
    * adds genome_flag, domain, ftp_basename columns to pnnl_lookup.csv
