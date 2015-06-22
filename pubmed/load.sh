#!/bin/bash 

# TODO: DRY: FabFile.py 

source ../common.sh 
source db.config 

echo ======================================================
echo "pubmed begin" 

$mysql_dataset -e "call DATASET(DATABASE())"

$mysql_dataset -e "call log('readme','DATABASE()')" 
$mysql_dataset -e "call log('DATABASE()','load')" 

echo ======================================================

$mysql_dataset -e "call log('load_tables','refresh')" 

load_table  tsv  file_list  file_list.txt
load_table  csv  PMC        PMC-ids.csv
load_table  tsv  deleted    deleted.pmids
load_table  csv  DOAJ       DOAJ.csv

