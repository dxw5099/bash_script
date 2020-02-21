PRIMERS=/home/genomics/genomics/apps/adapter_trim/adapter.fa
#PRIMERS=/common/genomics-core/apps/adapter_trim/adapter.fa
for sample in `ls *_R1_001.fastq.gz`
do
base=$(basename $sample "_R1_001.fastq.gz")
for name in ${base}_R1_001.fastq.gz; do
    if [ -f "$name" ]
    then
        #qsub -q all.q -N trim -cwd /common/genomics-core/apps/adapter_trim/trim_PE.sh ${base}
        cutadapt --minimum-length 30 -a file:$PRIMERS -A file:$PRIMERS -o $1_trimmed.R1.fastq.gz -p $1_trimmed.R2.fastq.gz $1.R1.fastq.gz $1.R2.fastq.gz > $1.log.txt
        break
    else
        #qsub -q all.q -N trim -cwd /common/genomics-core/apps/adapter_trim/trim_SE.sh ${base}
        cutadapt --minimum-length 30 -a file:$PRIMERS -o $1_trimmed.R1.fastq.gz $1.R1.fastq.gz > $1.log.txt
    fi
done
done


for sample in `ls *.R1.fastq.gz`
do
base=$(basename $sample ".R1.fastq.gz")
qsub -q all.q -N trim -cwd ./trim1.sh ${base}
done

trim_PE.sh
/common/genomics-core/anaconda2/bin/cutadapt --minimum-length 30 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -o $1.trimmed.R1.fastq.gz -p $1.trimmed.R2.fastq.gz $1.R1.fastq.gz $1.R2.fastq.gz > $1.log.txt

trim_SE.sh
/common/genomics-core/anaconda2/bin/cutadapt --minimum-length 30 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -o $1.trimmed.R1.fastq.gz $1.R1.fastq.gz > $1.log.txt


Adapter.fa
>A1_R1
AGATCGGAAGAGCACACGTCTGAACTCCAGTCA
>A1_R2
AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT
>A2_R1
TCGTCGGCAGCGTCAGATGTGTATAAGAGACAG
>A2_R2
GTCTCGTGGGCTCGGAGATGTGTATAAGAGACAG