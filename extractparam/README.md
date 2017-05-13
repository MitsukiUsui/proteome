# extractparam

## Summary

## Output
### pnnl_param.csv

|Organism|Dataset|param_num|
|:--|:--|:--|
|same as dir_name|name of the dataset|corresponding parameter set number|

* The pair of `Organism` & `Dataset` can be used as key.

## Scripts

0. extract_param.sh
    * Extracts information on MS-GF+ configuration from the corresponding `.mzid` file.
    * Organizes information at `~/out/.......`

0. classify_param.ipynb
    * Classify parameter sets into groups
    * Classification result are written as `param_num` column, and the corresponding parameter sets are written as `master_(param_num).param`
    * Manual creation of `exec_(param_num).sh` and `Mods_(param_num).txt` follows, according to `master_(param_num).param`  
