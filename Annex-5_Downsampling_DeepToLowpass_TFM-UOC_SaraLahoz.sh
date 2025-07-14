#$ -S /bin/bash

#$ -l h_rt=24:10:0

#$ -l h_vmem=70G,tmem=70G

#$ -wd /SAN/colcc/grahamlab-general/SaraLahoz

#$ -j y

#$ -N Downsampling_WGS_Lahoz



####################################
####################################
###### DOWNSAMPLE a deep-WGS file:

cd /SAN/colcc/grahamlab-general/SaraLahoz


###### ###### ######
### Define which Percentage of reads we need to add as "P" in function "picard DownsampleSam" 
### in order to achieve the COVERAGES we're interested in (= 0.05X, 0.1X, 1-10X):

###
#34.5346X --> 1
#0.1X --> P


###
#awk 'BEGIN {for (i=1; i<= 10; i++) print i}' | awk '$0+0 == $0 { printf "%.2f\n", $0 / 100 }' | tr "," "." > Range_coverages.txt   # 2nd option
awk 'BEGIN {for (i=1; i<= 10; i++) print i}' | tr "," "." > Range_coverages.txt   # 2nd option

i1=0.05
i2=0.1
i4=20

echo $i1 $i2 $i4 | tr " " "\n" >> Range_coverages.txt


# Order numerically the coverages written in "Range_coverages.txt":
sort -n -o Range_coverages.txt Range_coverages.txt 


# DIVIDE all numbers/values by 34.5346 (which is the total coverage of the original full BAM file):
> Range_coverages_2.txt  # Empty previously created dataframe

for val in $(cat Range_coverages.txt); do
echo $val | awk '{ printf "%.6f\n", $0 / 34.5346 }' >> Range_coverages_2.txt
done



###### ###### ######
### Run the TOOL to generate a range of downsampled_WGS_files:

for percreads in $(cat Range_coverages_2.txt); do 
/share/apps/jdk-15.0.2/bin/java -Xmx20G -jar /share/apps/genomics/picard-2.20.3/bin/picard.jar DownsampleSam \
I=EPICC_C551_D1_G9_D1-GRCh38.bam \
O=./Downsampled_WGS_Dec2022/EPICC_C551_D1_G9_D1-GRCh38_${percreads}.bam \
P=${percreads}
done
#P=0.2 means 20% of the reads



###### ###### ######
### Check COVERAGES of the previous downsampled WGS files:

### All BAM files:
cd /SAN/colcc/grahamlab-general/SaraLahoz/Downsampled_WGS_Dec2022

for bamfile in *.bam; do 
/share/apps/genomics/samtools-1.16.1/bin/samtools depth -a ${bamfile} | awk '{sum+=$3} END { print "Average depth = ",sum/NR}' >> AverageCoverage_DownsampledBAMs_Dec2022_2.txt
done
