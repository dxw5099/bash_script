chr=$(seq 1 1 22)" X Y M"
for i in $chr ; do
    /common/genomics-core/anaconda2/bin/samtools faidx $1 $i >> $2
done