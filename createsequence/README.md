# createsequence
## Summary
Creates various sequences database for peptide identification.

## Inputs
0. PNNL sequences
	* See [downloadpnnl](https://github.com/MitsukiUsui/proteome/tree/master/downloadpnnl) for further information.
	* Used to extract peptide sequence of contamination.
0. RefSeq
	* `_protein.faa` for `_annotated.fasta`
	* `_genomic.fna` for `_allorf.fasta`
	* `_cds_from_genomic.fna` for `_ocelot.fasta`


## Outputs

### Fasta
3 Type of fasta file are generated as sequence database for peptide identification.

0. `_annotated.fasta`
	* `.contami`+ RefSeq protein

0. `_ocelot???.fasta`
	* ??? denotes threshold for aa length.
	* `_annotated.fasta` + (filtered)ocelot
0. `_allorf???.fasta`
	* ??? denotes threshold for aa length.
	* `_annotated.fasta` + (filtered)allorf

### pnnl_sequence.csv

|Organism|Dataset|fasta_name|annotated|
|:--|:--|:--|:--|
|same as dir_name|name of the dataset|corresponding PNNL sequence used for downloaded `.mzid`|corresponding `_annotated.fasta`  filepath|


## Scripts

0. extract_contami.sh
	* Creates `.contami` file for all the downloaded PNNL sequence files.
	* Identifier "CON" are given to those extracted contamination sequences.

0. download_refseq.ipynb
	* Downloads `cds_from_genomic.fna` & `protein.faa` from RefSeq
	* !!!TBI!!!: download 25 files, not 41

0. create_annotated.sh
	* Creates `_annotated.fasta` for each PNNL sequence files.
		* The extension must be `.fasta` to be used for MS-GF+
	* Identifier "REF" are given to those annotated sequences.

0. assign_annotated.ipynb
	* Extracts information on which `_annotated.fasta` to use for peptide identification for each datasets.
	* Organizes extracted information into pnnl_sequence.csv.
