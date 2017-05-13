# createcatalog

## Summary
Organize scattered information about the 112 species in <https://www.nature.com/articles/sdata201541?WT.mc_id=TWT_NJapan_SciData_1508>.  


## Input
0. input.txt
    * copy text from SpeciesList section of proteomeXchange.
    * <http://proteomecentral.proteomexchange.org/cgi/GetDataset?ID=PXD001860>

0. pnnlFilename.txt

    ```
    wget -v --output-file=logfile.txt --recursive --spider ftp://MSV000079053:a@massive.ucsd.edu/ccms_result/
    cat logfile.txt |grep exists > pnnlFilename.txt
    ```
    * in order to get directly name

0. ???
    * 論文のsupplementary

## Output
### pnnl_lookup.csv

|scientific_name|tax_id|dir_name|genome_flag|
|:--|:--:|:--|:--:|
|Acidiphilium cryptum JF-5|349163|Acidiphilium_cryptum_JF-5|0|

* genome_flag (0/1): whether corresponding tax_id is included in genome analysis

## pnnl_downloads.csv
* the columns structure is the same as supplementray

## Scripts
0. parse_proteomexchange.ipynb
    * parses input.txt
    * only 111/112 species were found.

0. get_directory_name.ipynb
    * adds dir_name column to input.csv
    * manual curation needed because of 111 problem

0. integrate_with_genome
    * adds genome_flag column to pnnl_lookup.csv

0. pnnl_downloads.ipynb
    * chooses which datasets to analyze
    * max 10
