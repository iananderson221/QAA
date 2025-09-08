#!/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp                  #REQUIRED: which partition to use
#SBATCH --cpus-per-task=4                 #optional: number of cpus, default is 1
#SBATCH --mem=64GB                        #optional: amount of memory, default is 4GB per cpu
#SBATCH --mail-user=ica@uoregon.edu     #optional: if you'd like email
#SBATCH --mail-type=ALL                   #optional: must set email first, what type of email you want
#SBATCH --job-name=htseq-count_SRR25630305            #optional: job name
#SBATCH --output=htseq-count_%j.out       #optional: file to store stdout from job, %j adds the assigned jobID
#SBATCH --error=htseq-count_%j.err        #optional: file to store stderr from job, %j adds the assigned jobID
#SBATCH --time=6:00:00
mamba activate QAA

/usr/bin/time -v htseq-count -s yes -i gene_id\
  /projects/bgmp/ica/bioinfo/Bi623/PS2/QAA/SRR25630305/Cco_com125_EO_6cm.out.sorted.rmdup.sam \
  /projects/bgmp/ica/bioinfo/Bi623/PS2/QAA/SRR25630305/campylomormyrus.gtf \
  > /projects/bgmp/ica/bioinfo/Bi623/PS2/QAA/SRR25630305/Cco_com125_EO_6cm.htseq.stranded_yes.txt

/usr/bin/time -v htseq-count -s reverse -i gene_id\
  /projects/bgmp/ica/bioinfo/Bi623/PS2/QAA/SRR25630305/Cco_com125_EO_6cm.out.sorted.rmdup.sam \
  /projects/bgmp/ica/bioinfo/Bi623/PS2/QAA/SRR25630305/campylomormyrus.gtf \
  > /projects/bgmp/ica/bioinfo/Bi623/PS2/QAA/SRR25630305/Cco_com125_EO_6cm.htseq.stranded_reverse.txt