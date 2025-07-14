#$ -S /bin/bash

#$ -l h_rt=15:50:0

#$ -l h_vmem=15G,tmem=15G

#$ -wd /SAN/colcc/grahamlab-general/SaraLahoz/

#$ -j y

#$ -N Trim_AllFASTQ_2023



#######################################
################## -1 ##################


########## Current working directory:

cd /SAN/colcc/grahamlab-general/SaraLahoz/FASTQs_cfDNA_Mar2023


########## Set up FILENAMES:

filelist=$(ls ./Raw_FASTQs)

echo $filelist | tr " " "\n" > ./List_Files_FASTQ_19Apr2023.txt # Files
echo $filelist | tr " " "\n" | cut -f1,2,3,4,5,6,7 -d _ > ./List_Patients_FASTQ_19Apr2023.txt # Patient names

paste ./List_Files_FASTQ_19Apr2023.txt ./List_Patients_FASTQ_19Apr2023.txt > ./List_FASTQ_19Apr2023.txt


########## Set up DIRECTORIES:

results_dir=/SAN/colcc/grahamlab-general/SaraLahoz/FASTQs_cfDNA_Mar2023
fastqdir=/SAN/colcc/grahamlab-general/SaraLahoz/FASTQs_cfDNA_Mar2023/Raw_FASTQs
output=/SAN/colcc/grahamlab-general/SaraLahoz/FASTQs_cfDNA_Mar2023


########## Current working directory:

cd /SAN/colcc/grahamlab-general/SaraLahoz/FASTQs_cfDNA_Mar2023/Raw_FASTQs


########## TRIMMING (of 3’ end adaptor-sequences) using skewer:

	## BASH LOOP - Skewer (R1 and R2 files altogether):
for patient in $(cat ../List_FASTQ_19Apr2023.txt | awk '{print $2}' | uniq)
do
/share/apps/genomics/skewer-0.2.2/bin/skewer -x AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC -y AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTA -m pe -t 4 -z -r 0.1 -d 0.03 -Q 10 -z --quiet -n ${patient}_R1_001.fastq.gz ${patient}_R2_001.fastq.gz \
-o ${output}/trimming/${patient} 
done

# msg="trim adapter ends with skewer"; echo "-- $msg $longLine"; >&2 echo "-- $msg $longLine"
# make sure to exclude the -l 50 parameter to ensure that small fragments are retained! #
# use -z to compress output and prevent scratch from bursting

 
########## REMOVE initial FASTQ-files from scratch:
# rm -rf ${patient}_R1_001.fastq.gz
# rm -rf ${patient}_R2_001.fastq.gz


