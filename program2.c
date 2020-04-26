#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void matrix_vector_multiply(long long *c, long long *a, long long *b, long long n) {
   long long i, j,k;
for ( i=0; i<n; i++ )
     for ( j=0; j<n; j++ )
          for ( k=0; k<n; k++ )
                C[i*n+j]+=A[i*n+k]*B[k*n+j];


}

int main(int argc, char **argv) {
   long long size = 1000;
   if (argc >= 2) size = atoi(argv[1]);

   // y = Ax
   long long *A = (long long *)malloc(sizeof(long long) * size * size);
   long long *x = (long long *)malloc(sizeof(long long) * size*size);
   long long *y = (long long *)malloc(sizeof(long long) * size*size);
   long long i, j;
   //printf("9");
   for (i = 0; i < size; ++i)
      for (j = 0; j < size; j++)
         A[i*size + j] = j;

   for (i = 0; i < size; ++i)
      x[i] = i;

   //printf("%d\n",42
   clock_t begin = clock();

   matrix_vector_multiply(y, A, x, size);
   clock_t end = clock();

   double time_spent = (double)(end -  begin) / CLOCKS_PER_SEC;
   //printf("%d\n",52);
   printf("passed(%f)\n",time_spent);
   free(A);
   free(x);
   free(y);

   return 0;
}

