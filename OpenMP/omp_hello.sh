#!/bin/bash
## If you want to be updated by mail
#SBATCH --mail-user=youremail@example.com
#SBATCH --mail-type=ALL

#SBATCH --job-name=omp_hello          # Job name
#SBATCH --partition=hpc               # Partition to submit to
#SBATCH --qos=normal                  # Adjust to a valid QoS for your project
#SBATCH --nodes=1                     # Run on a single node
#SBATCH --ntasks=1                    # Only one task (OpenMP uses threads, not tasks)
#SBATCH --cpus-per-task=4             # Number of OpenMP threads
#SBATCH --output=%x.%j.out            # Standard output
#SBATCH --error=%x.%j.err             # Standard error

module load gcc-11.3                       # Load GCC with OpenMP support

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

gcc -fopenmp -o omp_hello omp_hello.c

# Run the program
./omp_hello