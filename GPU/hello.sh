#!/bin/bash

#SBATCH --mail-user=a90115@ualg.pt
#SBATCH --mail-type=ALL

#SBATCH --job-name=hello00
#SBATCH --partition=gpu
#SBATCH --qos=gpuvlabualg

#SBATCH --gres=gpu

#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err

module purge
module load cuda/12.6
nvcc -o hello hello.cu

echo `hostname`
srun ./hello
