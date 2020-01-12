#!/bin/R

# Run ExomeDepth for detecting CNVs

# Before running R code, install ExomeDepth library
library(exomeDepth)


# Bed file attach
Bedfile <-file.path("/home/Super_panel_S3128717_Padded_copia.bed")
targets<-read.table(Bedfile, header=T)

# Genome reference file attach
b37<- file.path("/home/ucsc.hg19_noExtraContigs.fasta")


# Control BAMs attach
bamFile_control <- c("/home/panel_controles/18NR8265_recReadx.bam", "/home/panel_controles/18NR09583_recReadx.bam", "/home/panel_controles/18NR09709_recReadx.bam", "/home/panel_controles/18NR9188_recReadx.bam", "/home/panel_controles/18NR09131_recReadx.bam", "/home/panel_controles/18NR09527_recReadx.bam", "/home/panel_controles/18NR08955_recReadx.bam", "/home/panel_controles/18NR7707_recReadx.bam", "/home/panel_controles/18NR7855_recReadx.bam", "/home/panel_controles/18NR8097_recReadx.bam", "/home/panel_controles/18NR8969_recReadx.bam", "/home/panel_controles/18NR09260_recReadx.bam", "/home/panel_controles/18NR09427_recReadx.bam", "/home/panel_controles/18NR8352_recReadx.bam", "/home/panel_controles/18NR9187_recReadx.bam", "/home/panel_controles/18NR09151_recReadx.bam", "/home/panel_controles/18NR08961_recReadx.bam", "/home/panel_controles/18NR8229_recReadx.bam", "/home/panel_controles/18NR8834_recReadx.bam", "/home/panel_controles/18NR09230_recReadx.bam")

# Create read count data from control BAMs
data_Control <- getBamCounts(bed.frame = targets,bam.files = bamFile_control,include.chr=FALSE,referenceFasta = b37)
Control_ExomeCount.dafr<-as(data_Control[,colnames(data_Control)],'data.frame')
Control_ExomeCount.dafr$chromosome<-gsub(as.character(Control_ExomeCount.dafr$space),pattern='chr',replacement = '')
print(head(Control_ExomeCount.dafr))
Control_ExomeCount.mat<-as.matrix(Control_ExomeCount.dafr[,grep(names(Control_ExomeCount.dafr),pattern='.*bam')])
Control_nsamples<-ncol(Control_ExomeCount.mat)


# Sample BAMs attach
bamFile_muestras<-c("/home/CCP17/15NS0124-4_recReadx.bam", "/home/CCP17/18NR1097_recReadx.bam", "/home/CCP17/18NR1830_recReadx.bam", "/home/CCP17/18NR1867_recReadx.bam", "/home/CCP17/18NR2292_recReadx.bam", "/home/CCP17/18NR4928_recReadx.bam", "/home/CCP17/18NR5097_recReadx.bam", "/home/CCP17/18NR7273_recReadx.bam", "/home/CCP17/18NR9133_recReadx.bam", "/home/CCP17/19NR01610_recReadx.bam", "/home/CCP17/19NR02900_recReadx.bam", "/home/CCP17/19NR03190_recReadx.bam", "/home/CCP17/19NR01843_recReadx.bam")

# Create read count data from sample BAMs
data_muestras<-getBamCounts(bed.frame=targets, bam.files=bamFile_muestras,include.chr=FALSE,referenceFasta = b37)
Muestras_ExomeCount.dafr<-as(data_muestras[,colnames(data_muestras)],"data.frame")
Muestras_ExomeCount.dafr$chromosome<-gsub(as.character(Muestras_ExomeCount.dafr$space),pattern='chr', replacement = '')
Muestras_ExomeCount.mat<-as.matrix(Muestras_ExomeCount.dafr[,grep(names(Muestras_ExomeCount.dafr),pattern='.*bam')])
Muestras_nsamples<-ncol(Muestras_ExomeCount.mat)
Muestras_samples<-colnames(Muestras_ExomeCount.dafr)


# Define control names
my.ref.samples<-c("X18NR8265_recReadx.bam","X18NR09583_recReadx.bam", "X18NR09709_recReadx.bam", "X18NR9188_recReadx.bam", "X18NR09131_recReadx.bam", "X18NR09527_recReadx.bam", "X18NR08955_recReadx.bam", "X18NR7707_recReadx.bam", "X18NR7855_recReadx.bam", "X18NR8097_recReadx.bam", "X18NR8969_recReadx.bam", "X18NR09260_recReadx.bam", "X18NR09427_recReadx.bam", "X18NR8352_recReadx.bam", "X18NR9187_recReadx.bam", "X18NR09151_recReadx.bam", "X18NR08961_recReadx.bam", "X18NR8229_recReadx.bam", "X18NR8834_recReadx.bam", "X18NR09230_recReadx.bam")
my.ref.sample.set<-as.matrix(Control_ExomeCount.dafr[, my.ref.samples])


# Loop over each samples
for(i in 1:Muestras_nsamples){
  sample<-Muestras_samples[i+6]  
	my.choice<-select.reference.set(test.counts=Muestras_ExomeCount.mat[,i], 
                                        reference.counts=my.ref.sample.set, 
                                        bin.length=(Control_ExomeCount.dafr$end-Control_ExomeCount.dafr$start)/1000,
                                        n.bins.reduced=10000)
  my.matrix<-as.matrix(Control_ExomeCount.dafr[,my.choice$reference.choice])
  my.reference.selected<-apply(X=my.matrix,MAR=1,FUN=sum)
  all.exons<-new("ExomeDepth",
                       test=Muestras_ExomeCount.mat[,i],
                       reference=my.reference.selected,
                       formula="cbind(test,reference)~1")
  show(all.exons)

  # CNV calling
  all.exons_CNVs<-CallCNVs(x=all.exons,
                           transition.probability=10^-3, 
                           chromosome=Control_ExomeCount.dafr$space, 
                           start=Control_ExomeCount.dafr$start, 
                           end=Control_ExomeCount.dafr$end,
                           name=Control_ExomeCount.dafr$names)
  head(all.exons_CNVs@CNV.calls)
  
  if(nrow(all.exons_CNVs@CNV.calls)>0){
    output.file<-paste0('Muestra_', i,".cnv.txt")
    write.table(file=file.path("/home/output/output_panel/exomedepth_output",output.file),x=all.exons_CNVs@CNV.calls,row.names=FALSE,quote=F,sep="\t")
}
}

