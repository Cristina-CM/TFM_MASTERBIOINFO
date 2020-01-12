#!#/usr/bash

# Run Breakseq2 for detecting breakpoint

# The pysam and biopython packages must be installed.
# Need samtools and BWA software to run breakseq2
# Download breakpoint libray (http://sv.gersteinlab.org/phase1bkpts/breakseq2_bplib_20150129.zip)
# Breakseq2 package download and install using pip

# Run Breakseq2
python run_breakseq2.py --reference /home/ucsc.hg19_noExtraContigs.fasta --bams /home/SSV6/15NS0124-4_recReadx.bam /home/SSV6/18NR1097_recReadx.bam /home/SSV6/18NR1830_recReadx.bam /home/SSV6/18NR1867_recReadx.bam /home/SSV6/18NR2292_recReadx.bam /home/SSV6/18NR4928_recReadx.bam /home/SSV6/18NR5097_recReadx.bam /home/SSV6/18NR7273_recReadx.bam /home/SSV6/18NR9133_recReadx.bam /home/SSV6/19NR01610_recReadx.bam /home/SSV6/19NR02900_recReadx.bam /home/SSV6/19NR03190_recReadx.bam /home/SSV6/19NR01843_recReadx.bam  --work /home/output/output_panel/breakseq/ --bwa /home/bwa-0.7.12/bwa --samtools /home/samtools-1.9/samtools --bplib /home/breakseq2_bplib_20150129.fna --nthreads 4


