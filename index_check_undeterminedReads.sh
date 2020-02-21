#!/bin/bash
#Get index combination and count from sequence identifier
zcat ~/genomics/data/Temp/Sequence_Temp/NextSeq/Fastq_Generation/181120_NS500624_0262_AH525YBGX9/Undetermined_S0_R1_001.fastq.gz | grep "^@" | cut -d : -f 10 | sort | uniq -c | sort -nr  > indices.txt
echo "Top 10 index combinations are: "
head indices.txt