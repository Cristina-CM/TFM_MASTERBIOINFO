# TFM_MASTERBIOINFO


1. Installation Docker imagen with the tools for using in the execution of CNV detection algorithms. 

  Create a Docker directory from shell
  
    mkdir Docker && cd Docker

 Create a dockefile with all necessary for building the image docker into Docker directory 
 
    touch dockerfile 

 For building a docker image from the Dockerfile
 
    sudo docker build -t ubuntu:16.04 .

 For running the docker image
 
    sudo docker run -v /path_to_local_data/:/home -it ubuntu:16.04

    
  This dockerfile will install CNVkit, DECoN and Breakseq with pysam y biopython dependences. R that is necessary to ExomeDepth  and DECoN.



2. Instruction for running four CNV detection algorithms inside of docker image: DECoN, ExomeDepth, CNVKit and Breakseq2
