#!/usr/bin/env bash

#SBATCH --job-name=fastqc
#SBATCH --time=06:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mail-type=ALL
#SBATCH --mail-user=hiz.jamali@csiro.au
#SBATCH --array=0-24
#SBATCH --output=array_%A-%a.out
#SBATCH --mem=10GB

# Set input and output 

#----------------------project variables------------------------# 
IN_DIR=/OSM/CBR/AF_DATASCHOOL/input/Hiz_Kim/data/
OUT_DIR=/OSM/CBR/AF_DATASCHOOL/input/Hiz_Kim/processed/fastqc/

#---------------------------------------------------------------#

# To run fastqc on a single file as a batch job

#first load the fastqc module

module load fastqc


# Now use this command to run fasqc on single file by specifyimg the file path to Bowen where this file is stored

# fastqc -o /OSM/CBR/AF_DATASCHOOL/input/Hiz_Kim/processed/fastqc/ /OSM/CBR/AF_DATASCHOOL/input/Hiz_Kim/data/Pool2_S2_R1_001.fastq.gz
  
# Adding -o sets the target folder

#SAMPLES=( "sampleA");
#INFILES=( "Pool20_S20_R1_001.fastq.gz");
 
if [ ! -z "$SLURM_ARRAY_TASK_ID" ]

    then
        i=$SLURM_ARRAY_TASK_ID
        IN_FILE=${IN_DIR}/${Pool2_S2_R1_001.fastq.gz}
        fastqc ${IN_FILE} --noextract -o ${OUT_DIR}.sampleA.txt
    else

    echo "Error: Missing array index as SLURM_ARRAY_TASK_ID"
fi
