#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void matrix_vector_multiply(long long *y, long long *A, long long *x, long long size) {
   long long i, j;

   for (i = 0; i < size; ++i) {
      for (j = 0; j < size; ++j) {
         y[j] += A[j*size + i] * x[i];
      }
   }
}

int main(int argc, char **argv) {
for(int i = 0; i < 31 ; i++){
   long long size = i*1000;
   if (argc >= 2) size = atoi(argv[1]);

   // y = Ax
   long long *A = (long long *)malloc(sizeof(long long) * size * size);
   long long *x = (long long *)malloc(sizeof(long long) * size);
   long long *y = (long long *)calloc(size, sizeof(long long));
   long long i, j;

   for (i = 0; i < size; ++i)
      for (j = 0; j < size; j++)
         A[i*size + j] = j;

   for (i = 0; i < size; ++i)
      x[i] = i;
   clock_t begin = clock();
   matrix_vector_multiply(y, A, x, size);
   clock_t end = clock();

   for (i = 1; i < size; ++i)
      if (y[i] != y[i-1]) {
         printf("failed\n");
         return 1;
      }

   //printf("passed(%ld)\n", y[0]);
   printf("%f\n",(double)((end - begin) * 1000/ CLOCKS_PER_SEC));;
   free(A);
   free(x);
   free(y);
}
   return 0;
}

