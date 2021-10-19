#!/bin/bash
 
# --------------------------------------------------------------
### PART 1: Requests resources to run your job.
# --------------------------------------------------------------
#SBATCH --job-name=w3n
#SBATCH --output=%x-%j.out
#SBATCH --mail-type=ALL
#SBATCH --partition=windfall
#SBATCH --time=100:00:00 
#SBATCH --ntasks=24
#SBATCH --ntasks-per-node=24
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=5gb

module purge
module load phdf5-intel
module load netcdf-fortran/intel
export I_MPI_PMI_LIBRARY=/usr/lib64/libpmi.so

cd /xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB3_04_npert/run

srun --ntasks 24 ./mitgcmuv > output.txt

