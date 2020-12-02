#include <stdio.h>
#include <omp.h>
#include <windows.h>
int main(){
omp_set_nested(TRUE);

#pragma omp parallel
    {
    #pragma omp single
    printf("hola estoy enla zona externa nivel %d\n",omp_get_active_level());
    #pragma omp single
    #pragma omp parallel
    {
        #pragma omp single
        printf("hola estoy en la zona media nivel %d\n",omp_get_active_level());

        #pragma omp single
        #pragma omp parallel num_threads(1)
        {

            {
            printf("hola estoy en la zona interna nivel %d\n",omp_get_level());
            printf("Id del hilo antecesor: %d\n",omp_get_ancestor_thread_num(3));
            }

        }

    }

    }
    return 0;
}
