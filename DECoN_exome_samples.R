#!/bin/R

# Run DECoN for detecting CNVs

# Calculate coverage each for each exon specific in the BED file in each sample file
Rscript ReadInBams.R --bams /home/SSV6/ --bed /home/Agilent_SureSelect_allExons_V6.bed --fasta /home/ucsc.hg19_noExtraContigs.fasta --out /home/output/output_exomas/decon_output/DECONtest

# Evaluate median coverage level of samples based on their correlation with other samples
Rscript IdentifyFailures.R --Rdata /home/output/output_exomas/decon_output/DECONtest.RData --mincorr .97 --mincov 20 --out /home/output/output_exomas/decon_output/DECONtest

# CNV calling
Rscript makeCNVcalls.R --Rdata /home/output/output_exomas/decon_output/DECONtest.RData --out  /home/output/output_exomas/decon_output/DECONtestCalls 


