#!/bin/bash

#PBS -N DaphniaMakerDM_T2
#PBS -k o
#PBS -q cpu
#PBS -l nodes=1:ppn=32,vmem=200gb
#PBS -l walltime=48:00:00
#PBS -q shared
#BS -m abe
#PBS -M rtraborn@indiana.edu

WD=/N/dc2/projects/Daphnia_Gene_Expression/annotation

ulimit -s unlimited
module load module load perl-dbd-oracle/1.68
module load bioperl/1.6.1 
module load maker/2.27-beta       
module add mpich2/1.4.1-gnu 

cd $WD #change to the working directory

#######################################################
##  Run Maker to Generate A Genome Annotation ##
#######################################################

## begin running Maker

mpiexec -n 32 -hostfile $PBS_NODEFILE maker maker_opts.ctl maker_bopts.ctl maker_exe.ctl 

##### Done Running Maker ######
