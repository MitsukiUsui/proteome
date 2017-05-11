#!/bin/sh

IFS=$'\n'
catalog="../createcatalog/pnnl_downloads.csv"
for line in `tail -n +2 ${catalog}`
do
	organism=`echo ${line} | cut -d ',' -f 1`
	dataset=`echo ${line} | cut -d ',' -f 3`
	dir="/home/mitsuki/out/altorf/proteome/param/"
	master=${dir}master1.param
	filepath=${dir}${organism}/${dataset}.param
	diff -q ${master} ${filepath}
	#if $
done

