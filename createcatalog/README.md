# createcatalog

## Summary

## Input
0. input.txt
    * copy text from SpeciesList section of <http://proteomecentral.proteomexchange.org/cgi/GetDataset?ID=PXD001860>
0. pnnlFilename.txt
    *

## Output
0. pnnl_lookup.csv
    * genome_flag (0/1): whether corresponding tax_id is included in genome analysis

|scientific_name|tax_id|dir_name|genome_flag|
|:--|:--:|:--|:--:|
|Acidiphilium cryptum JF-5|349163|Acidiphilium_cryptum_JF-5|0|


## Scripts
0. parse_proteomexchange.ipynb
    * parses input.txt
    * only 111/112 species were found.
0. get_directory_name.ipynb
    * adds dir_name column to input.csv
    * manual curation needed because of 111 problem
0. integrate_with_genome
    * adds genome_flag column to pnnl_lookup.csv
