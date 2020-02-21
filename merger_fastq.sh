#!/bin/bash
dir="/common/genomics-core/data/Temp/Sequence_Temp/NovaSeq/Fastq_Generation/190822_A00319_0067_AHFLCMDRXX_11_55_45/CL-7309-07-18-2019_Marban_Eduardo_Total_RNA_Rat/"
for sample in `ls *fastq.gz`
do
base=$(basename $sample ".fastq.gz")
#ls -lh ${sample} ${dir}/${sample}
cat ${sample} ${dir}/${sample} > ${base}_merged.fastq.gz
zcat ${base}_merged.fastq.gz | echo $((`wc -l`/4))
done

echo "Subject: Merge done!" | sendmail -v di.wu@cshs.org

