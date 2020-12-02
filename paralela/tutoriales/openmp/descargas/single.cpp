#include <stdio.h>
#include <omp.h>

int main(){
int a,i,n=9;
int b[n];
#pragma omp parallel shared(a,b) private(i)
{
#pragma omp single
{
a = 10;
printf("Single construct executed by thread %d\n",omp_get_thread_num());
}
/* A barrier is automatically inserted here */
#pragma omp for
for (i=0; i<n; i++)
b[i] = a;
} /*-- End of parallel region --*/
printf("After the parallel region:\n");
for (i=0; i<n; i++)
printf("b[%d] = %d\n",i,b[i]);
    return 0;
}
