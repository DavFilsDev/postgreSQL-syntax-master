#!/bin/bash
# Run a SQL file on a database
# Usage: ./run_query.sh dbname path/to/query.sql

DBNAME=$1
SQLFILE=$2

psql -d $DBNAME -f $SQLFILE
