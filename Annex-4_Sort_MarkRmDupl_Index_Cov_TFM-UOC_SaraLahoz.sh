#$ -S /bin/bash

#$ -l h_rt=6:00:0

#$ -l h_vmem=45G,tmem=45G

#$ -wd /SAN/colcc/grahamlab-general/SaraLahoz/

#$ -j y

#$ -N RemoveDupl_AllFASTQ_May2023


########## Current working directory:
cd /SAN/colcc/grahamlab-general/SaraLahoz/FASTQs_cfDNA_Mar2023


##########################################
########## Set up directories:

results_dir=/SAN/colcc/grahamlab-general/SaraLahoz/FASTQs_cfDNA_Mar2023
#fastqdir=/SAN/colcc/grahamlab-general/SaraLahoz/FASTQs_cfDNA_Mar2023/trimming
#output=SAN/colcc/grahamlab-general/SaraLahoz/FASTQs_cfDNA_Mar2023

#readgroup="@RG\tID:${patient}\tLB:${patient}\tSM:${patient}\tPL:ILLUMINA"
#ref_genome=/SAN/colcc/grahamlab-software/hg19_Reference/ucsc.hg19.fasta
#ref_genome=/SAN/colcc/grahamlab-general/SaraLahoz/hg38_Reference/hg38.fa


########## SORT BAM files & INDEX them using picard:

for patient in $(cat ./List_FASTQ_26Apr2023.txt | awk '{print $2}' | uniq)
do
/share/apps/jdk-15.0.2/bin/java -Xmx20G -jar /share/apps/genomics/picard-2.20.3/bin/picard.jar SortSam INPUT=${results_dir}/processingbams/${patient}_unsort.bam \
OUTPUT=${results_dir}/processingbams/${patient}.bam \
SORT_ORDER=coordinate CREATE_INDEX=true
done


########## MARK PCR-DUPLICATES:
for patient in $(cat ./List_FASTQ_29May2023.txt | awk '{print $2}' | uniq)
do
/share/apps/jdk-15.0.2/bin/java -Xmx20G -jar /share/apps/genomics/picard-2.20.3/bin/picard.jar MarkDuplicates INPUT=${results_dir}/processingbams/${patient}_RG.bam OUTPUT=${results_dir}/processingbams/${patient}.duplicates.bam METRICS_FILE=${results_dir}/processingbams/${patient}.metrics.file CREATE_INDEX=true
done


########## REMOVE PCR-DUPLICATES using samtools:
for patient in $(cat ./List_FASTQ_22May2023.txt | awk '{print $2}' | uniq)
do
/share/apps/genomics/samtools-1.16.1/bin/samtools rmdup ${results_dir}/processingbams/${patient}.duplicates.bam ${results_dir}/finalbams/${patient}.no_duplicates.bam
done


########## Create BAI-INDEX:
for patient in $(cat ./List_FASTQ_22May2023.txt | awk '{print $2}' | uniq)
do
/share/apps/jdk-15.0.2/bin/java -jar /share/apps/genomics/picard-2.20.3/bin/picard.jar BuildBamIndex INPUT=${results_dir}/finalbams/${patient}.no_duplicates.bam OUTPUT=${results_dir}/finalbams/${patient}.no_duplicates.bai
done



########## Calculate COVERAGES of the previous lpWGS  files:
cd /SAN/colcc/grahamlab-general/SaraLahoz/FASTQs_cfDNA_Mar2023/finalbams

#
for bamfile in *.bam; do
/share/apps/genomics/samtools-1.16.1/bin/samtools depth -a ${bamfile} | awk '{sum+=$3} END { print "Average depth ${bamfile} = ",sum/NR}' >> AverageCoverage_BAMs_May2023.txt
done


