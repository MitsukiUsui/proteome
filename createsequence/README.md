# createsequence
## Summary
Creates sequences needed for peptide identification.

## Inputs
0. pnnl sequences
	* See downloadpnnl directory for further information.
	* To extract information on contamination
0. RefSeq
	* `_protein.faa` for `_annotated.fasta`
	* `_cds_from_genomic.fna` for `_ocelot30.fasta`

## Type of fasta
3 Type of fasta file are created as database for MS-GF+.

0. `_annotated.fasta`
	* `.contami`+ RefSeq protein
0. `_ocelot30.fasta`
	* `_annotated.fasta` + ocelot30
0. `_allorf30.fasta`
	* `_annotated.fasta` + allorf30

## csv
* pnnl_sequence.csv

|Organism|Dataset|annotated|
|:--|:--|:--|
|same as dir_name|name of the dataset|corresponding `_annotated.fasta`  filepath|

* The pair of `Organism` & `Dataset` can be used as key. 


## Scripts

0. extract_contami.sh
	* Creates `.contami` file for all the downloaded pnnl sequence files.
	* Identifier "CON" are given to those extracted contamination sequences.

0. download_refseq.ipynb
	* Downloads cds_from_genomic & protein from RefSeq
	* !!!TBI: download 25 files, not 41!!!

0. create_annotated.sh
	* Creates `_annotated.fasta` for each pnnl sequence files.
		* The extension must be `.fasta` to use for MS-GF+
	* Identifier "REF" are given to those annotated sequences.

0. assign_annotated.ipynb
	* Extracts information on which `_annotated.fasta` to use for peptide identification for each datasets.
	* Organizes extracted information into pnnl_sequence.csv.
