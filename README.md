#####################################################################

# Title: FASTQtoBAM_lpWGS

Author: Sara Lahoz

Link: https://github.com/sr-lhz/FASTQtoBAM_lpWGS.git

Directory/Path: /sr-lhz/FASTQtoBAM_lpWGS

Description: This repository contains a genome alignment workflow that takes raw FASTQ files from low-pass whhole-genome sequencing (lpWGS), aligns them to a reference genome (like hg38), and outputs BAM files ready for analysis (including calling of copy-number alterations, CNAs).

The (N=5) scripts that conform this workflow are listed below:
1. ./*Annex-1_Trimming_AllFASTQs_TFM-UOC_SaraLahoz.sh*
2. ./*Annex-2_Alignment_AllFASTQs_TFM-UOC_SaraLahoz.sh*
3. ./*Annex-3_ReplaceRGHeader_SortedBAMs_TFM-UOC_SaraLahoz.sh*
4. ./*Annex-4_Sort_MarkRmDupl_Index_Cov_TFM-UOC_SaraLahoz.sh*
5. ./*Annex-5_Downsampling_DeepToLowpass_TFM-UOC_SaraLahoz.sh*
   
#####################################################################
