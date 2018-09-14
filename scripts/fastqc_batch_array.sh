#!/usr/bin/env bash

#SBATCH --job-name=fastqc
#SBATCH --time=01:00:00
#SBATCH --ntasks=1
#SBATCH --mem=2GB
#SBATCH --array=0-24
#SBATCH --mail-type=ALL
#SBATCH --mail-user=hiz.jamali@csiro.au
#SBATCH --output=logs/fastqc_%A.out

#-------------- set input and output directories---------#
 
IN_DIR=/OSM/CBR/AF_DATASCHOOL/input/Hiz_Kim/data/
OUT_DIR=/OSM/CBR/AF_DATASCHOOL/input/Hiz_Kim/processed/fastqc/

#--------------------------------------------------------------------------------------------------------#

module load fastqc

IN_FILE_LIST=( $(cut -d , -f 1 outputs/file_list.csv ) ); #can also use cat 

if [ ! -z "$SLURM_ARRAY_TASK_ID" ]
    then
        i=$SLURM_ARRAY_TASK_ID
        
	IN_FILE=${IN_DIR}/${IN_FILE_LIST[$i]}
	fastqc ${IN_FILE} --noextract -o ${OUT_DIR}

		
    else
        echo "Error: Missing array index as SLURM_ARRAY_TASK_ID"
fi


