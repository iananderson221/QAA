#!/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp                  #REQUIRED: which partition to use
#SBATCH --cpus-per-task=4                 #optional: number of cpus, default is 1
#SBATCH --mem=64GB                        #optional: amount of memory, default is 4GB per cpu
#SBATCH --mail-user=ica@uoregon.edu     #optional: if you'd like email
#SBATCH --mail-type=ALL                   #optional: must set email first, what type of email you want
#SBATCH --job-name=picard_SRR25630305            #optional: job name
#SBATCH --output=picard_%j.out       #optional: file to store stdout from job, %j adds the assigned jobID
#SBATCH --error=picard_%j.err        #optional: file to store stderr from job, %j adds the assigned jobID
#SBATCH --time=6:00:00
mamba activate QAA

/usr/bin/time -v picard MarkDuplicates \
  INPUT=/projects/bgmp/ica/bioinfo/Bi623/PS2/QAA/SRR25630305/Cco_com125_EO_6cm.out.sorted.sam \
  OUTPUT=/projects/bgmp/ica/bioinfo/Bi623/PS2/QAA/SRR25630305/Cco_com125_EO_6cm.out.sorted.rmdup.sam \
  METRICS_FILE=/projects/bgmp/ica/bioinfo/Bi623/PS2/QAA/SRR25630305/Cco_com125_EO_6cm.metrics \
  REMOVE_DUPLICATES=TRUE \
  VALIDATION_STRINGENCY=LENIENT