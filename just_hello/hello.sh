#!/bin/bash

## If you want to be updated by mail
#SBATCH --mail-user=your_user_name@your_mailserver
#SBATCH --mail-type=ALL

#SBATCH --job-name=hello
#SBATCH --partition=hpc
#SBATCH --qos=normal 
#SBATCH --ntasks=1

## The result of the job, respectively stdout e stderr
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err

module load python
echo "Hello HPC World, from bash script!"
python3 hello.py