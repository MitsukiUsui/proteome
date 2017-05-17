# exec
## Summary
Execute peptide identification using MS-GF+

## Scripts
0. call_exec.sh
    * According to `../extractparam/pnnl_param.csv` & `../createsequence/pnnl_sequence`, do peptide identification using MS-GF+

0. check_param.sh
    * check whether above peptide identification was executed with the same MS-GF+ configuretion with downloaded `_msgfplus.mzid`
    * please grep log with "differ"
