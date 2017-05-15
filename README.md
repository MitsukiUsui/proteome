# What's this?
This is a sub project of altorf, analyzing altorf from proteome perspective.

## Workflow
Follow this flow from top to bottom. For further information, please refer to README on each sub directories.

0. createcatalog
    * Chooses which species and dataset to analyze.

0. pickdatasets
    * Pick which datasets to analyze, considering MS/MS type and the number of identified peptide.

0. downloadpnnl
    * Downloads picked `.mzML`, `.mzid` & `.fasta` files from [PNNL dataset](https://www.nature.com/articles/sdata201541?WT.mc_id=TWT_NJapan_SciData_1508).

0. extractparam
    * Extracts information from `.mzid`s on parameters for peptide identification with MS-GF+.

0. createsequence
    * Creates various sequences for peptide identification.

0. exec
    * Execute peptide identification using MS-GF+

## Prerequisites
* [MS-GF+](https://omics.pnl.gov/software/ms-gf)
    * performs peptide identification
    * requires >=JRE 1.6 and Main maemory >=2GB
* Anaconda (ver 3.X)
* BioPython
