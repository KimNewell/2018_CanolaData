#!/usr/bin/env bash

#SBATCH --job-name=fastqc
#SBATCH --time=01:00:00
#SBATCH --ntasks=1
#SBATCH --mem=2GB


# To run fastqc on a single file as a batch job

#first load the fastqc module

module load fastqc


# Now use this command to run fasqc on single file by specifyimg the file path to Bowen where this file is stored

# fastqc -o /OSM/CBR/AF_DATASCHOOL/input/Hiz_Kim/processed/fastqc/ /OSM/CBR/AF_DATASCHOOL/input/Hiz_Kim/data/Pool2_S2_R1_001.fastq.gz
  
# Adding -o sets the target folder


for f in /OSM/CBR/AF_DATASCHOOL/input/Hiz_Kim/data/*.gz; do
  fastqc -o /OSM/CBR/AF_DATASCHOOL/input/Hiz_Kim/processed/fastqc/ ${f}; 

done
