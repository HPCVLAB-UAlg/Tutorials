#!/bin/bash
## If you want email notifications
#SBATCH --mail-user=youremail@example.com
#SBATCH --mail-type=ALL

#SBATCH --job-name=hybrid_hello         # Job name
#SBATCH --partition=hpc                 # Partition
#SBATCH --qos=normal                    # Adjust to valid QoS for your project
#SBATCH --nodes=1                       # Number of nodes
#SBATCH --ntasks=2                      # Number of MPI processes
#SBATCH --cpus-per-task=4               # Threads per MPI process (OpenMP)
#SBATCH --output=%x.%j.out              # Standard output
#SBATCH --error=%x.%j.err               # Standard error

module load gcc11/openmpi/4.1.4         # Load MPI + OpenMP-capable compiler

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

echo "Compiling hybrid hello with mpicc and OpenMP support..."
mpicc -fopenmp -o hello_hybrid hello_hybrid.c

echo "Running hybrid hello..."
mpirun ./hello_hybrid

