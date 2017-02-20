#!/bin/bash
for i in */*.sql; do echo $i; cat $i | mysql -ppass; done

