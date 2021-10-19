#!/bin/bash
 
# --------------------------------------------------------------
### PART 1: Requests resources to run your job.
# --------------------------------------------------------------
#SBATCH --job-name=w12i
#SBATCH --output=%x.out
#SBATCH --mail-type=ALL
#SBATCH --partition=windfall
#SBATCH --time=100:00:00 
#SBATCH --ntasks=336
#SBATCH --ntasks-per-node=28
#SBATCH --nodes=12
#SBATCH --mem-per-cpu=5gb

module purge
module load phdf5-intel
module load netcdf-fortran/intel
export I_MPI_PMI_LIBRARY=/usr/lib64/libpmi.so

### set directory for job execution, ~netid = home directory path
cd /xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_01_init/run

ulimit -n 4096

srun --ntasks 336 ./mitgcmuv > output.txt
