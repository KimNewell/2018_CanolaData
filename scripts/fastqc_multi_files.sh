#!/usr/bin/env bash
#SBATCH --job-name=fastqc
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --exclusive
#SBATCH --mem=120GB


# To run fastqc on a single file as a batch job

#first load the fastqc module

module load fastqc


# Now use this command to run fasqc on single file by specifyimg the file path to Bowen where this file is stored

fastqc -o /OSM/CBR/AF_DATASCHOOL/input/Hiz_Kim/processed/fastqc/ /OSM/CBR/AF_DATASCHOOL/input/Hiz_Kim/data/Pool2_S2_R1_001.fastq.gz
  
# Adding -o sets the target folder
