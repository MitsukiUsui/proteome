# createcatalog

## Summary
Pick which datasets to analyze, considering the number of identified peptide in each datasets.

## Inputs
0. pnnl_datasets.csv
	* [Supplementray Table 2](https://www.nature.com/article-assets/npg/sdata/2015/sdata201541/extref/sdata201541-s3.xls)
	* convert first sheet to `.csv` format

## Outputs
0. sample_pnnl_datasets.csv
    * randomly sampled datasets for #identification filter.

0. summarize.csv

0. pnnl_downloads.csv


## Scripts
0. sample_datasets.ipynb
    * Randomly chooses datasets for each species (Max 30 datasets for each)

0. $AWKCOMMAND
    * Downloads designated `.mzid` files in sampled_pnnl_datasets.csv

0. conv_tsv.sh
    * Converts downloaded `.mzid` files into `.tsv` format
    * Almost the same as the one in processresult directory.

0. summarize_identification.py
    * `python summarize_identification.py summarize.csv`
    * Summarizes peptide identification (summarize.csv) while referring to each `.tsv`
    * Almost the same as the one in processresult directory.

0. filter_datasets.ipynb
    * Select datasets which identification result is good.
