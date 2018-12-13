#include  <omp.h >
#include  <stdio.h >
#include  <time.h >
#include  <sys/time.h>


int main (int argc, char *argv[])
{
    double area,x;
    int i,n;
    area = 0.0;
    printf("numero de rectangulos="); scanf("%d",&n);
    #pragma omp parallel for private(x) reduction(+:area)
    for (i=0;i<n;i++)
    {     x=(i+0.5)/n;
          area += 4.0/(1.0+x*x);
    }
    printf("pi = %.16g\n", area/n);
    return 0;
}
