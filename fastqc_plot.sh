#!/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp                  #REQUIRED: which partition to use
#SBATCH --cpus-per-task=4                 #optional: number of cpus, default is 1
#SBATCH --mem=16GB                        #optional: amount of memory, default is 4GB per cpu
#SBATCH --mail-user=ica@uoregon.edu     #optional: if you'd like email
#SBATCH --mail-type=ALL                   #optional: must set email first, what type of email you want
#SBATCH --job-name=fastqc_plot_SRR25630397_R2            #optional: job name
#SBATCH --output=fastqc_plot_%j.out       #optional: file to store stdout from job, %j adds the assigned jobID
#SBATCH --error=fastqc_plot_%j.err        #optional: file to store stderr from job, %j adds the assigned jobID
#SBATCH --time=8:00:00

#/usr/bin/time ./fastqc_plot.py -f "/projects/bgmp/ica/bioinfo/Bi623/PS2/QAA/SRR25630305/Cco_com125_EO_6cm_1.fastq.gz" -l 150

#/usr/bin/time ./fastqc_plot.py -f "/projects/bgmp/ica/bioinfo/Bi623/PS2/QAA/SRR25630305/Cco_com125_EO_6cm_2.fastq.gz" -l 150

#/usr/bin/time ./fastqc_plot.py -f "/projects/bgmp/ica/bioinfo/Bi623/PS2/QAA/SRR25630397/Crh_rhy107_EO_adult_1.fastq.gz" -l 150

/usr/bin/time ./fastqc_plot.py -f "/projects/bgmp/ica/bioinfo/Bi623/PS2/QAA/SRR25630397/Crh_rhy107_EO_adult_2.gz" -l 150