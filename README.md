# What's this?
This is a sub project of altorf, analyzing altorf from proteome perspective. By executing peptide identification with various sequence database using MS-GF+, we can find those peptides which is missing from annotation, but actually translated. [pnnl library](https://www.nature.com/articles/sdata201541?WT.mc_id=TWT_NJapan_SciData_1508) was used as MS/MS data inputs.

## Workflow
Follow this flow from top to bottom. For further information, please refer to README on each sub directories.

0. [createcatalog](https://github.com/MitsukiUsui/proteome/tree/master/createcatalog)
    * Organizes scattered information about the 112 species in [pnnl library](https://www.nature.com/articles/sdata201541?WT.mc_id=TWT_NJapan_SciData_1508).

0. [pickdatasets](https://github.com/MitsukiUsui/proteome/tree/master/pickdatasets)
    * Picks which datasets to analyze, considering MS/MS type and the number of identified peptides.

0. [downloadpnnl](https://github.com/MitsukiUsui/proteome/tree/master/downloadpnnl)
    * Downloads picked `.mzML`, `.mzid` & `.fasta` files from [pnnl library ftp location](ftp://massive.ucsd.edu/).

0. [extractparam](https://github.com/MitsukiUsui/proteome/tree/master/extractparam)
    * Extracts information from each `.mzid`s on parameters for peptide identification using MS-GF+.

0. [createsequence](https://github.com/MitsukiUsui/proteome/tree/master/createsequence)
    * Creates various sequences database for peptide identification.

0. [exec](https://github.com/MitsukiUsui/proteome/tree/master/exec)
    * Execute peptide identification using MS-GF+.

0. [processresult](https://github.com/MitsukiUsui/proteome/tree/master/processresult)
    

## Prerequisites
* [MS-GF+](https://omics.pnl.gov/software/ms-gf)
    * performs peptide identification
    * requires >=JRE 1.6 and Main maemory >=2GB
* Anaconda (ver 3.X)
* BioPython
