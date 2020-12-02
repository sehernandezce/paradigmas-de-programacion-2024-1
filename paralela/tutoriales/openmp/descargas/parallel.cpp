#include <stdio.h>
#include <omp.h>
#include <windows.h>
int main(){

omp_set_num_threads(5);
if(!omp_in_parallel())
{
    printf("Numero de procesadores es: %d\n",omp_get_num_procs());
    printf("Numero maximo de hilos es %d\n",omp_get_max_threads());
}
double start = omp_get_wtime();

# pragma omp parallel
{
  printf("Hola soy el hilo %d  de %d\n",omp_get_thread_num(),omp_get_num_threads());
}
Sleep(1);
double end = omp_get_wtime();
printf("Inicio = %.16g\nFin = %f\nDiferencia =%.16g \n",start,end,end - start);
    return 0;
}
