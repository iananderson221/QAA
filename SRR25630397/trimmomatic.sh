#!/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp                  #REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                 #optional: number of cpus, default is 1
#SBATCH --mem=16GB                        #optional: amount of memory, default is 4GB per cpu
#SBATCH --mail-user=ica@uoregon.edu     #optional: if you'd like email
#SBATCH --mail-type=ALL                   #optional: must set email first, what type of email you want
#SBATCH --job-name=trimmomatic_SRR25630305            #optional: job name
#SBATCH --output=trimmomatic_%j.out       #optional: file to store stdout from job, %j adds the assigned jobID
#SBATCH --error=trimmomatic_%j.err        #optional: file to store stderr from job, %j adds the assigned jobID
#SBATCH --time=6:00:00
mamba activate QAA

/usr/bin/time -v trimmomatic PE \
-threads 4 \
/projects/bgmp/ica/bioinfo/Bi623/PS2/QAA/SRR25630397/Crh_rhy107_EO_adult_1.trim.fastq.gz \
/projects/bgmp/ica/bioinfo/Bi623/PS2/QAA/SRR25630397/Crh_rhy107_EO_adult_2.trim.fastq.gz \
/projects/bgmp/ica/bioinfo/Bi623/PS2/QAA/SRR25630397/Crh_rhy107_EO_adult_1.trim.paired.fastq.gz \
/projects/bgmp/ica/bioinfo/Bi623/PS2/QAA/SRR25630397/Crh_rhy107_EO_adult_1.trim.unpaired.fastq.gz \
/projects/bgmp/ica/bioinfo/Bi623/PS2/QAA/SRR25630397/Crh_rhy107_EO_adult_2.trim.paired.fastq.gz \
/projects/bgmp/ica/bioinfo/Bi623/PS2/QAA/SRR25630397/Crh_rhy107_EO_adult_2.trim.unpaired.fastq.gz \
HEADCROP:8 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:5:15 \
MINLEN:35