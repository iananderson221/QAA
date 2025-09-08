#!/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp                  #REQUIRED: which partition to use
#SBATCH --cpus-per-task=1                 #optional: number of cpus, default is 1
#SBATCH --mem=8GB                        #optional: amount of memory, default is 4GB per cpu
#SBATCH --mail-user=ica@uoregon.edu     #optional: if you'd like email
#SBATCH --mail-type=ALL                   #optional: must set email first, what type of email you want
#SBATCH --job-name=plot_trimmed_reads_SRR25630397            #optional: job name
#SBATCH --output=plot_trimmed_reads_%j.out       #optional: file to store stdout from job, %j adds the assigned jobID
#SBATCH --error=plot_trimmed_reads_%j.err        #optional: file to store stderr from job, %j adds the assigned jobID
#SBATCH --time=6:00:00

/usr/bin/time -v ./plot_trimmed_lengths.py \
  --sample Crh_rhy107_EO_adult \
  --r1 /projects/bgmp/ica/bioinfo/Bi623/PS2/QAA/SRR25630397/Crh_rhy107_EO_adult_1.trim.paired.fastq.gz \
  --r2 /projects/bgmp/ica/bioinfo/Bi623/PS2/QAA/SRR25630397/Crh_rhy107_EO_adult_2.trim.paired.fastq.gz
