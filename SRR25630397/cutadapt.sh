#!/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp                  #REQUIRED: which partition to use
#SBATCH --cpus-per-task=4                 #optional: number of cpus, default is 1
#SBATCH --mem=16GB                        #optional: amount of memory, default is 4GB per cpu
#SBATCH --mail-user=ica@uoregon.edu     #optional: if you'd like email
#SBATCH --mail-type=ALL                   #optional: must set email first, what type of email you want
#SBATCH --job-name=cutadapt_SRR25630397            #optional: job name
#SBATCH --output=cutadapt_%j.out       #optional: file to store stdout from job, %j adds the assigned jobID
#SBATCH --error=cutadapt_%j.err        #optional: file to store stderr from job, %j adds the assigned jobID
#SBATCH --time=6:00:00
mamba activate QAA

/usr/bin/time -v cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -o Crh_rhy107_EO_adult_1.trim.fastq.gz -p Crh_rhy107_EO_adult_2.trim.fastq.gz Crh_rhy107_EO_adult_1.fastq.gz Crh_rhy107_EO_adult_2.fastq.gz

