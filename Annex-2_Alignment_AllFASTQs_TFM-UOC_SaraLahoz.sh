#$ -S /bin/bash

#$ -l h_rt=55:00:0

#$ -l h_vmem=50G,tmem=50G

#$ -wd /SAN/colcc/grahamlab-general/SaraLahoz/

#$ -j y

#$ -N Alignment_AllFASTQ


########## Current working directory:
cd /SAN/colcc/grahamlab-general/SaraLahoz/FASTQs_cfDNA_Mar2023


########## Set up directories:

results_dir=/SAN/colcc/grahamlab-general/SaraLahoz/FASTQs_cfDNA_Mar2023
fastqdir=/SAN/colcc/grahamlab-general/SaraLahoz/FASTQs_cfDNA_Mar2023/trimming
output=SAN/colcc/grahamlab-general/SaraLahoz/FASTQs_cfDNA_Mar2023

readgroup="@RG\tID:${patient}\tLB:${patient}\tSM:${patient}\tPL:ILLUMINA"
ref_genome=/SAN/colcc/grahamlab-general/SaraLahoz/hg38_Reference/hg38.fa


########### Set up FILENAMES:

filelist=$(ls ./trimming)

echo $filelist | tr " " "\n" | grep ".fastq.gz" > ./List_Files_FASTQ_26Apr2023.txt # Files
echo $filelist | tr " " "\n" | grep "fastq.gz" | sed 's/\-.*$//' > ./List_Patients_FASTQ_26Apr2023.txt # Patient names

paste ./List_Files_FASTQ_26Apr2023.txt ./List_Patients_FASTQ_26Apr2023.txt > ./List_FASTQ_26Apr2023.txt



########## ALIGNMENT using BWA-MEM (generating a SAM file), && 
########## pipe to samtools to convert to BAM:

### Create INDEXED FASTA-file (for posterior BWA MEM):
/share/apps/genomics/bwa-0.7.17/bwa index ${ref_genome}


### Run alignment algorithm BWA MEM:

for patient in $(cat ./List_FASTQ_26Apr2023.txt | awk '{print $2}' | uniq)
do
/share/apps/genomics/bwa-0.7.17/bwa mem -M -t 2 -R ${readgroup} ${ref_genome} \
${results_dir}/trimming/${patient}-trimmed-pair1.fastq.gz ${results_dir}/trimming/${patient}-trimmed-pair2.fastq.gz | /share/apps/genomics/samtools-1.16.1/bin/samtools view -@ 2 -bh -q 30 -o ${results_dir}/processingbams/${patient}_unsort.bam
done



########## Print Number of Reads with each FLAG: 

for patient in $(cat ./List_FASTQ_26Apr2023.txt | awk '{print $2}' | uniq)
do
/share/apps/genomics/samtools-1.16.1/bin/samtools flagstat ${results_dir}/processingbams/${patient}_unsort.bam > ${results_dir}/processingbams/Flagstat_LowpassBAM_${patient}.txt
done
