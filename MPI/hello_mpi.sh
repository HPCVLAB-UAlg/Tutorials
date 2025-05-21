#!/bin/bash
## If you want to be updated by mail
#SBATCH --mail-user=youremail@example.com
#SBATCH --mail-type=ALL

#SBATCH --job-name=hello
#SBATCH --partition=hpc     # Partition to submit to
#SBATCH --nodes=1           # Number of nodes
#SBATCH --ntasks=4          # Total number of MPI tasks
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err

module load gcc11/openmpi/4.1.4

mpicc -o hello_mpi hello_mpi.c

mpirun ./hello_mpi
