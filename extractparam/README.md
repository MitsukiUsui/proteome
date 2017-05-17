# extractparam

## Summary
Extracts information from each `.mzid`s on parameters for peptide identification using MS-GF+.

## Output
### pnnl_param.csv

|Organism|Dataset|param_num|
|:--|:--|:--|
|same as dir_name|name of the dataset|corresponding parameter set number|

* param_num specify which parameter set are used for downloaded `.mzid`

### master
Directory to store master_(param_num).param and its corresponding exec_(param_num).sh & Mods_(param_num).txt.

## Scripts

0. extract_param.sh
    * Extracts information on MS-GF+ configuration from the corresponding `.mzid` file.
    * Outputs information at `/home/mitsuki/out/altorf/proteome/param/$ORGANISM/`

0. classify_param.ipynb
    * Classifies parameter sets into groups.
    * Classification result are written as `param_num` column, and the corresponding parameter sets are written as `master_(param_num).param`.
    * Manual creation of `exec_(param_num).sh` and `Mods_(param_num).txt` follows, according to `master_(param_num).param`.
