#####################################################################

# Title: FASTQtoBAM_lpWGS

Author: Sara Lahoz

Link: https://github.com/sr-lhz/FASTQtoBAM_lpWGS.git

Directory/Path: /sr-lhz/FASTQtoBAM_lpWGS

Description: This repository contains a genome alignment workflow that takes raw FASTQ files from low-pass whhole-genome sequencing (lpWGS), aligns them to a reference genome (like hg38), and outputs BAM files ready for analysis (including calling of copy-number alterations, CNAs).

The scripta (N=6) included in each ML-based classifier model are (image below):
1. Imputation to predict missing values.
2. Scaling and re-centering of numerical predictors.
3. Model construction using a specific algorithm (i.e., gradient boosting machine, GBM; random forest; logistic regression; penalized logistic regression, LASSO; support vector machines, SVM; etc.)
4. Calculate predictions (i.e., probability of event per subject/case/row) based on previously trained model.
5. Cross-validation (in case a separate validstiono cohort is missing).
6. Evaluation of model performance (accuracy; sensitivity/specificity/precision/recall; area under the curve, AUC).

#####################################################################

![Example Image - Stepwise structure of ML-based models ](Stepwise_ML_pipeline.png)
