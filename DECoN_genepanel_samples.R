#!/bin/R

# Run DECoN for detecting CNVs

# Calculate coverage each for each exon specific in the BED file in each sample file
Rscript ReadInBams.R --bams /home/CCP17/ --bed /home/Super_panel_S3128717_Padded_copia.bed --fasta /home/ucsc.hg19_noExtraContigs.fasta --out /home/output/output_panel/decon/DECONtest

# Evaluate median coverage level of samples based on their correlation with other samples
Rscript IdentifyFailures.R --Rdata /home/output/output_panel/decon/DECONtest.RData --mincorr .97 --mincov 100 --out /home/output/output_panel/decon/DECONtest

# CNV calling
Rscript makeCNVcalls.R --Rdata /home/output/output_panel/decon/DECONtest.RData --out  /home/output/output_panel/decon/DECONtestCalls


