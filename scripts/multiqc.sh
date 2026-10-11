#!/bin/bash
set -euo pipefail

echo "Starting multiqc"

#Create output dir 

mkdir -p results/multiqc

# Running fastqc with multiqc container 
apptainer exec oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20 multiqc --outdir results/multiqc results/fastqc