# pickdatasets

## Summary
Picks datasets to analyze, considering MS/MS type and the number of identified peptides.

## Inputs
0. pnnl_datasets.csv
	* list of all available datasets in [PNNL library](https://www.nature.com/articles/sdata201541?WT.mc_id=TWT_NJapan_SciData_1508)
	* converted first sheet of [Supplementray Table 2](https://www.nature.com/article-assets/npg/sdata/2015/sdata201541/extref/sdata201541-s3.xls) to `.csv` format

## Outputs
0. pnnl_downloads.csv
    * The column structure is the same as pnnl_datasets.csv.


## Scripts
0. sample_datasets.ipynb
    * Randomly chooses datasets for each species (Max 30 datasets for each).

0. download_mzid.sh
    * Downloads corresponding `.mzid` files in sampled_pnnl_datasets.csv.
    * created by `awk -F, 'NR>1{print "wget -P /tmp -x ftp://MSV000079053:a@massive.ucsd.edu/result/"$1"/"$3"_msgfplus.mzid.gz"}' sampled_pnnl_datasets.csv > download_mzid.sh`

0. conv_tsv.sh
    * Converts downloaded `.mzid` files into `.tsv` format
    * !!!TBI!!!Almost the same as the one in processresult directory. Integration needed in the future.

0. summarize_identification.py
    * `python summarize_identification.py summarize.csv`
    * Summarizes peptide identification (summarize.csv) while referring to each `.tsv`
    * !!!TBI!!!Almost the same as the one in processresult directory. Integration needed in the future.

0. filter_datasets.ipynb
    * Select datasets which showed good peptide identification results.
