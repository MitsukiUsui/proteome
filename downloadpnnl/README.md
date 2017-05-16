# downloadpnnl
## Summary
Downloads `.mzML`, `.mzid`, and `.fasta` from [PNNL library ftp location](ftp://massive.ucsd.edu/), according to `../pickdatasets/pnnl_downloads.csv`

## Scripts
0. create_scripts.sh
    * Creates `download_sequence.sh`, which downloads sequence files

0. download_pnnl.sh
    * Downloads `.mzML`, `.mzid` from PNNL datasets.
    * If the file is already downloaded, skip to next datasets.
