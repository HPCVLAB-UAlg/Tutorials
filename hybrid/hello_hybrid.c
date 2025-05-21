#include <mpi.h>
#include <omp.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
    int rank, size;

    // Initialize MPI
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank); // process ID
    MPI_Comm_size(MPI_COMM_WORLD, &size); // total number of processes

    // Parallel OpenMP region inside each MPI process
    #pragma omp parallel
    {
        int tid = omp_get_thread_num();               // thread ID
        int nthreads = omp_get_num_threads();         // threads in this process

        printf("Hello from thread %d out of %d in MPI process %d out of %d\n",
               tid, nthreads, rank, size);
    }

    MPI_Finalize(); // Finalize MPI
    return 0;
}