#$ -S /bin/bash

#$ -l h_rt=10:00:0

#$ -l h_vmem=45G,tmem=45G

#$ -wd /SAN/colcc/grahamlab-general/SaraLahoz/

#$ -j y

#$ -N ReplaceRG_AllFASTQ_May2023


########## Current working directory:

cd /SAN/colcc/grahamlab-general/SaraLahoz/FASTQs_cfDNA_Mar2023


########## Set up directories & variables:

results_dir=/SAN/colcc/grahamlab-general/SaraLahoz/FASTQs_cfDNA_Mar2023
#readgroup="@RG\tID:${patient}\tLB:${patient}\tSM:${patient}\tPL:ILLUMINA”


########## Run function “addreplacerg” INDIVIDUALLY for each SAMPLE/BAM_FILE (as this function did not previously work in Loop…):

#
/share/apps/genomics/samtools-1.16.1/bin/samtools addreplacerg -r "@RG\tID:L79_0058_GEMCAD_batch01_cfDNA_01_S1\tLB:L79_0058_GEMCAD_batch01_cfDNA_01_S1\tSM:L79_0058_GEMCAD_batch01_cfDNA_01_S1\tPL:ILLUMINA" -w ${results_dir}/processingbams/L79_0058_GEMCAD_batch01_cfDNA_01_S1.bam -o ${results_dir}/processingbams/L79_0058_GEMCAD_batch01_cfDNA_01_S1_RG.bam
#
/share/apps/genomics/samtools-1.16.1/bin/samtools addreplacerg -r "@RG\tID: L79_0059_GEMCAD_batch01_cfDNA_02_S2\tLB: L79_0059_GEMCAD_batch01_cfDNA_02_S2\tSM: L79_0059_GEMCAD_batch01_cfDNA_02_S2\tPL:ILLUMINA" -w ${results_dir}/processingbams/L79_0059_GEMCAD_batch01_cfDNA_02_S2.bam -o ${results_dir}/processingbams/L79_0059_GEMCAD_batch01_cfDNA_02_S2.bam
#
/share/apps/genomics/samtools-1.16.1/bin/samtools addreplacerg -r "@RG\tID: L79_0060_GEMCAD_batch01_cfDNA_03_S3\tLB:L79_0060_GEMCAD_batch01_cfDNA_03_S3\tSM: L79_0060_GEMCAD_batch01_cfDNA_03_S3\tPL:ILLUMINA" -w ${results_dir}/processingbams/L79_0060_GEMCAD_batch01_cfDNA_03_S3.bam -o ${results_dir}/processingbams/L79_0060_GEMCAD_batch01_cfDNA_03_S3.bam
#
/share/apps/genomics/samtools-1.16.1/bin/samtools addreplacerg -r "@RG\tID: L79_0060_GEMCAD_batch01_cfDNA_03_S3\tLB:L79_0061_GEMCAD_batch01_cfDNA_04_S4\tSM: L79_0061_GEMCAD_batch01_cfDNA_04_S4\tPL:ILLUMINA" -w ${results_dir}/processingbams/L79_0061_GEMCAD_batch01_cfDNA_04_S4.bam -o ${results_dir}/processingbams/L79_0061_GEMCAD_batch01_cfDNA_04_S4.bam
#
/share/apps/genomics/samtools-1.16.1/bin/samtools addreplacerg -r "@RG\tID:L79_0062_GEMCAD_batch01_cfDNA_05_S5\tLB:L79_0062_GEMCAD_batch01_cfDNA_05_S5\tSM:L79_0062_GEMCAD_batch01_cfDNA_05_S5\tPL:ILLUMINA" -w ${results_dir}/processingbams/L79_0062_GEMCAD_batch01_cfDNA_05_S5.bam -o ${results_dir}/processingbams/L79_0062_GEMCAD_batch01_cfDNA_05_S5_RG.bam
#
/share/apps/genomics/samtools-1.16.1/bin/samtools addreplacerg -r "@RG\tID:L79_0063_GEMCAD_batch01_cfDNA_06_S6\tLB:L79_0063_GEMCAD_batch01_cfDNA_06_S6\tSM:L79_0063_GEMCAD_batch01_cfDNA_06_S6\tPL:ILLUMINA" -w ${results_dir}/processingbams/L79_0063_GEMCAD_batch01_cfDNA_06_S6.bam -o ${results_dir}/processingbams/L79_0063_GEMCAD_batch01_cfDNA_06_S6_RG.bam
#
/share/apps/genomics/samtools-1.16.1/bin/samtools addreplacerg -r "@RG\tID:L79_0064_GEMCAD_batch01_cfDNA_07_S7\tLB:L79_0064_GEMCAD_batch01_cfDNA_07_S7\tSM:L79_0064_GEMCAD_batch01_cfDNA_07_S7\tPL:ILLUMINA" -w ${results_dir}/processingbams/L79_0064_GEMCAD_batch01_cfDNA_07_S7.bam -o ${results_dir}/processingbams/L79_0064_GEMCAD_batch01_cfDNA_07_S7_RG.bam
#
/share/apps/genomics/samtools-1.16.1/bin/samtools addreplacerg -r "@RG\tID:L79_0065_GEMCAD_batch01_cfDNA_08_S8\tLB:L79_0065_GEMCAD_batch01_cfDNA_08_S8\tSM:L79_0065_GEMCAD_batch01_cfDNA_08_S8\tPL:ILLUMINA" -w ${results_dir}/processingbams/L79_0065_GEMCAD_batch01_cfDNA_08_S8.bam -o ${results_dir}/processingbams/L79_0065_GEMCAD_batch01_cfDNA_08_S8_RG.bam
#
/share/apps/genomics/samtools-1.16.1/bin/samtools addreplacerg -r "@RG\tID:L79_0066_GEMCAD_batch01_cfDNA_09_S9\tLB:L79_0066_GEMCAD_batch01_cfDNA_09_S9\tSM:L79_0066_GEMCAD_batch01_cfDNA_09_S9\tPL:ILLUMINA" -w ${results_dir}/processingbams/L79_0066_GEMCAD_batch01_cfDNA_09_S9.bam -o ${results_dir}/processingbams/L79_0066_GEMCAD_batch01_cfDNA_09_S9_RG.bam
#
/share/apps/genomics/samtools-1.16.1/bin/samtools addreplacerg -r "@RG\tID:L79_0067_GEMCAD_batch01_cfDNA_10_S10\tLB:L79_0067_GEMCAD_batch01_cfDNA_10_S10\tSM:L79_0067_GEMCAD_batch01_cfDNA_10_S10\tPL:ILLUMINA" -w ${results_dir}/processingbams/L79_0067_GEMCAD_batch01_cfDNA_10_S10.bam -o ${results_dir}/processingbams/L79_0067_GEMCAD_batch01_cfDNA_10_S10_RG.bam
#
/share/apps/genomics/samtools-1.16.1/bin/samtools addreplacerg -r "@RG\tID:L79_0068_GEMCAD_batch01_cfDNA_11_S11\tLB:L79_0068_GEMCAD_batch01_cfDNA_11_S11\tSM:L79_0068_GEMCAD_batch01_cfDNA_11_S11\tPL:ILLUMINA" -w ${results_dir}/processingbams/L79_0068_GEMCAD_batch01_cfDNA_11_S11.bam -o ${results_dir}/processingbams/L79_0068_GEMCAD_batch01_cfDNA_11_S11_RG.bam
#
/share/apps/genomics/samtools-1.16.1/bin/samtools addreplacerg -r "@RG\tID:L79_0069_GEMCAD_batch01_cfDNA_12_S12\tLB:L79_0069_GEMCAD_batch01_cfDNA_12_S12\tSM:L79_0069_GEMCAD_batch01_cfDNA_12_S12\tPL:ILLUMINA" -w ${results_dir}/processingbams/L79_0069_GEMCAD_batch01_cfDNA_12_S12.bam -o ${results_dir}/processingbams/L79_0069_GEMCAD_batch01_cfDNA_12_S12_RG.bam
#
/share/apps/genomics/samtools-1.16.1/bin/samtools addreplacerg -r "@RG\tID:L79_0070_GEMCAD_batch01_cfDNA_13_S13\tLB:L79_0070_GEMCAD_batch01_cfDNA_13_S13\tSM:L79_0070_GEMCAD_batch01_cfDNA_13_S13\tPL:ILLUMINA" -w ${results_dir}/processingbams/L79_0070_GEMCAD_batch01_cfDNA_13_S13.bam -o ${results_dir}/processingbams/L79_0070_GEMCAD_batch01_cfDNA_13_S13_RG.bam
#
/share/apps/genomics/samtools-1.16.1/bin/samtools addreplacerg -r "@RG\tID:L79_0071_GEMCAD_batch01_cfDNA_14_S14\tLB:L79_0071_GEMCAD_batch01_cfDNA_14_S14\tSM:L79_0071_GEMCAD_batch01_cfDNA_14_S14\tPL:ILLUMINA" -w ${results_dir}/processingbams/L79_0071_GEMCAD_batch01_cfDNA_14_S14.bam -o ${results_dir}/processingbams/L79_0071_GEMCAD_batch01_cfDNA_14_S14_RG.bam


