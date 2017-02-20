#!/bin/bash
echo "DROP DATABASE IF EXISTS test" | mysql -ppass
echo "CREATE DATABASE test" | mysql -ppass

cat tables.sql | mysql -ppass
#Creates all the sprocs
for i in */*.sql; do echo $i; cat $i | mysql -ppass; done

cat marvelInsert.sql | mysql -ppass
cat csseInsert.sql | mysql -ppass
