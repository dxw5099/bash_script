#!/bin/bash
mkdir fasta
for sample in `ls *fastq.gz`
do
base=$(basename $sample ".fastq.gz")
zcat ${base}.fastq.gz | awk '!/^>/ { printf "%s", $0; n = "\n" } /^>/ { print n $0; n = "" } END { printf "%s", n }'  | gzip > fasta/${base}.fa.gz
done