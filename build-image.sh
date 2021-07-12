#!/bin/bash

echo ""

echo -e "\nbuild docker hadoop image\n"
docker build -t liliangshan/hadoop-2.7.2:1.0 .
echo ""
