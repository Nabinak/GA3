#!/bin/bash
set -euo pipefail

echo "Starting multiqc"
#Assign a value to the variable 


# multiqc container 
CONTAINER=oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20

#Placeholder variables
fastqc="$1"
multiqc="$2"

#Create output dir if needed 
mkdir -p "$multiqc"

#Run Multiqc with its cotainer
apptainer exec "$CONTAINER" multiqc --outdir "$multiqc" "$fastqc"



