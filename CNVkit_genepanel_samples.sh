#!/bin/bash

# Run CNVkit for detecting CNVs

# Create reference using BAMs, capture regions (BED), and genome sequence
python3 cnvkit.py batch /home/CCP17/15NS0124-4_recReadx.bam /home/CCP17/18NR1097_recReadx.bam /home/CCP17/18NR1830_recReadx.bam /home/CCP17/18NR1867_recReadx.bam /home/CCP17/18NR2292_recReadx.bam /home/CCP17/18NR4928_recReadx.bam /home/CCP17/18NR5097_recReadx.bam /home/CCP17/18NR7273_recReadx.bam /home/CCP17/18NR9133_recReadx.bam /home/CCP17/19NR01610_recReadx.bam /home/CCP17/19NR02900_recReadx.bam /home/CCP17/19NR03190_recReadx.bam /home/CCP17/19NR01843_recReadx.bam --normal /home/panel_controles/18NR8265_recReadx.bam /home/panel_controles/18NR09583_recReadx.bam /home/panel_controles/18NR09709_recReadx.bam /home/panel_controles/18NR9188_recReadx.bam /home/panel_controles/18NR09131_recReadx.bam /home/panel_controles/18NR09527_recReadx.bam /home/panel_controles/18NR08955_recReadx.bam /home/panel_controles/18NR7707_recReadx.bam /home/panel_controles/18NR7855_recReadx.bam /home/panel_controles/18NR8097_recReadx.bam /home/panel_controles/18NR8969_recReadx.bam /home/panel_controles/18NR09260_recReadx.bam /home/panel_controles/18NR09427_recReadx.bam /home/panel_controles/18NR8352_recReadx.bam /home/panel_controles/18NR9187_recReadx.bam /home/panel_controles/18NR09151_recReadx.bam /home/panel_controles/18NR08961_recReadx.bam /home/panel_controles/18NR8229_recReadx.bam /home/Archivo_2018/18NR8834_recReadx.bam /home/Archivo_2018/18NR09230_recReadx.bam --targets /home/Super_panel_S3128717_Padded_copia.bed --fasta /home/ucsc.hg19_noExtraContigs.fasta --output-reference /home/output/cnvkit_output/reference.cnn --output-dir /home/output/cnvkit_output/reference



# Each of the sample BAMs is normalized to the reference
python3 cnvkit.py batch /home/CCP17/15NS0124-4_recReadx.bam -r /home/output/cnvkit_output/reference.cnn -d /home/output/cnvkit_output/15NS0124-4/
python3 cnvkit.py batch /home/CCP17/18NR1097_recReadx.bam -r /home/output/cnvkit_output/reference.cnn -d /home/output/cnvkit_output/18NR1097/
python3 cnvkit.py batch /home/CCP17/18NR1830_recReadx.bam -r /home/output/cnvkit_output/reference.cnn -d /home/output/cnvkit_output/18NR1830/
python3 cnvkit.py batch /home/CCP17/18NR1867_recReadx.bam -r /home/output/cnvkit_output/reference.cnn -d /home/output/cnvkit_output/18NR1867/
python3 cnvkit.py batch /home/CCP17/18NR2292_recReadx.bam -r /home/output/cnvkit_output/reference.cnn -d /home/output/cnvkit_output/18NR2292/
python3 cnvkit.py batch /home/CCP17/18NR4928_recReadx.bam -r /home/output/cnvkit_output/reference.cnn -d /home/output/cnvkit_output/18NR4928/
python3 cnvkit.py batch /home/CCP17/18NR5097_recReadx.bam -r /home/output/cnvkit_output/reference.cnn -d /home/output/cnvkit_output/18NR5097/
python3 cnvkit.py batch /home/CCP17/18NR7273_recReadx.bam -r /home/output/cnvkit_output/reference.cnn -d /home/output/cnvkit_output/18NR7273/
python3 cnvkit.py batch /home/CCP17/18NR9133_recReadx.bam -r /home/output/cnvkit_output/reference.cnn -d /home/output/cnvkit_output/18NR9133/
python3 cnvkit.py batch /home/CCP17/19NR01610_recReadx.bam -r /home/output/cnvkit_output/reference.cnn -d /home/output/cnvkit_output/19NR01610/
python3 cnvkit.py batch /home/CCP17/19NR02900_recReadx.bam -r /home/output/cnvkit_output/reference.cnn -d /home/output/cnvkit_output/19NR02900/
python3 cnvkit.py batch /home/CCP17/19NR03190_recReadx.bam -r /home/output/cnvkit_output/reference.cnn -d /home/output/cnvkit_output/19NR03190/
python3 cnvkit.py batch /home/CCP17/19NR01843_recReadx.bam -r /home/output/cnvkit_output/reference.cnn -d /home/output/cnvkit_output/19NR01843/


# CNV calling
python3 cnvkit.py genemetrics /home/output/cnvkit_output/15NS0124-4/15NS0124-4_recReadx.cnr -s /home/output/cnvkit_output/15NS0124-4/15NS0124-4_recReadx.cns -t 0.2 -m 3 > /home/output/cnvkit_output/15NS0124-4/15NS0124-4_2.txt

python3 cnvkit.py genemetrics /home/output/cnvkit_output/18NR1097/18NR1097_recReadx.cnr -s /home/output/cnvkit_output/18NR1097/18NR1097_recReadx.cns -t 0.2 -m 3 > /home/output/cnvkit_output/18NR1097/18NR1097_2.txt

python3 cnvkit.py genemetrics /home/output/cnvkit_output/18NR1830/18NR1830_recReadx.cnr -s /home/output/cnvkit_output/18NR1830/18NR1830_recReadx.cns -t 0.2 -m 3 > /home/output/cnvkit_output/18NR1830/18NR1830_2.txt

python3 cnvkit.py genemetrics /home/output/cnvkit_output/18NR1867/18NR1867_recReadx.cnr -s /home/output/cnvkit_output/18NR1867/18NR1867_recReadx.cns -t 02 -m 3 > /home/output/cnvkit_output/18NR1867/18NR1867_2.txt

python3 cnvkit.py genemetrics /home/output/cnvkit_output/18NR2292/18NR2292_recReadx.cnr -s /home/output/cnvkit_output/18NR2292/18NR2292_recReadx.cns -t 0.2 -m 3 > /home/output/cnvkit_output/18NR2292/18NR2292_2.txt

python3 cnvkit.py genemetrics /home/output/cnvkit_output/18NR4928/18NR4928_recReadx.cnr -s /home/output/cnvkit_output/18NR4928/18NR4928_recReadx.cns -t 0.2 -m 3 > /home/output/cnvkit_output/18NR4928/18NR4928_2.txt

python3 cnvkit.py genemetrics /home/output/cnvkit_output/18NR5097/18NR5097_recReadx.cnr -s /home/output/cnvkit_output/18NR5097/18NR5097_recReadx.cns -t 0.2 -m 3 > /home/output/cnvkit_output/18NR5097/18NR5097_2.txt

python3 cnvkit.py genemetrics /home/output/cnvkit_output/18NR7273/18NR7273_recReadx.cnr -s /home/output/cnvkit_output/18NR7273/18NR7273_recReadx.cns -t 0.2 -m 3 > /home/output/cnvkit_output/18NR7273/18NR7273_2.txt

python3 cnvkit.py genemetrics /home/output/cnvkit_output/18NR9133/18NR9133_recReadx.cnr -s /home/output/cnvkit_output/18NR9133/18NR9133_recReadx.cns -t 0.2 -m 3 > /home/output/cnvkit_output/18NR9133/18NR9133_2.txt

python3 cnvkit.py genemetrics /home/output/cnvkit_output/19NR01610/19NR01610_recReadx.cnr -s /home/output/cnvkit_output/19NR01610/19NR01610_recReadx.cns -t 0.2 -m 3 > /home/output/cnvkit_output/19NR01610/19NR01610_2.txt

python3 cnvkit.py genemetrics /home/output/cnvkit_output/19NR02900/19NR02900_recReadx.cnr -s /home/output/cnvkit_output/19NR02900/19NR02900_recReadx.cns -t 0.2 -m 3 > /home/output/cnvkit_output/19NR02900/19NR02900_2.txt

python3 cnvkit.py genemetrics /home/output/cnvkit_output/19NR03190/19NR03190_recReadx.cnr -s /home/output/cnvkit_output/19NR03190/19NR03190_recReadx.cns -t 0.2 -m 3 > /home/output/cnvkit_output/19NR03190/19NR03190_2.txt

python3 cnvkit.py genemetrics /home/output/cnvkit_output/19NR01843/19NR01843_recReadx.cnr -s /home/output/cnvkit_output/19NR01843/19NR01843_recReadx.cns -t 0.2 -m 3 > /home/output/cnvkit_output/19NR01843/19NR01843_2.txt

