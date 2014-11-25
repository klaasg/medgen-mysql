#!/bin/bash

set -e
source common.sh 

require $1 "pick a dataset like ./load_database.sh gene" 

dbconfig="$1/db.config"

require $dbconfig "DATASET/db.config not found" 
source  $dbconfig

require $DATASET  "which dataset?" 

interpolate_file_config "templates/load"  > $DATASET/load.sh
cat $DATASET/load_tables                 >> $DATASET/load.sh 

pushd . 
cd $DATASET
chmod +x load.sh 
./load.sh 
popd 

echo '##################################################################' 
echo "DATASET: $DATASET " 

$mysql_dataset -e 'call tail'; 
$mysql_dataset -e 'call mem'; 

echo '##################################################################' 
