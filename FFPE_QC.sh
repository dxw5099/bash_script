cd $1
project=$2
config="/home/genomics/genomics/apps/multiqc/multiqc_config_example.yaml"

for folder in `ls`
do
sample=`ls $folder/*/`
dir="$folder/star_out/$sample"
base=$(basename $sample ".fastq.gz")
mv ${dir}/starLog.final.out ${dir}/$base.final.out
cat ${dir}/read_counts.txt | grep -v "__"| sort -k 1 > ${dir}/${base}_counts.txt
rm ${dir}/read_counts.txt
{ printf 'Gene\t'"${base}"'\n'; cat ${dir}/${base}_counts.txt; } > ${base}_counts.txt
mv ${dir}/starAligned.sortedByCoord.out.UMI.bam ${dir}/$base.UMI.bam
mv ${dir}/starAligned.sortedByCoord.out.UMI.bam.bai ${dir}/$base.UMI.bam.bai
done

/home/genomics/anaconda2/bin/multiqc  -c $config $1
#paste *_counts.txt | column -s $'\t' -t | grep -v "__" | awk 'NR==1{for(i=1;i<=NF;i++)b[$i]++&&a[i]}{for(i in a)$i="";gsub(" +"," ")}1' > counts.txt
paste *_counts.txt | awk 'NR==1{for(i=1;i<=NF;i++)b[$i]++&&a[i]}{for(i in a)$i="";gsub(" +"," ")}1' > counts.txt

mkdir final_result
mv counts.txt final_result/$project"_counts.txt"
mv multiqc_report.html final_result/$project"_QC.html"