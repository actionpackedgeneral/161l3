#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void matrix_vector_multiply(long long *c, long long *a, long long *b, long long n) {
   long long i, j,k;
   for(i = 0; i < n; i+=2){
      for(j = 0; j < n;j+=2){
            register double c1 = c[i*n + j];
            register double c2 = c[(i+1)*n + j];
            register double c3 = c[i*n + (j+1)];
            register double c4 = c[(i+1)*n + (j+1)];
         for(k = 0; k < n;k+=2){
               register double a1 = a[i*n + k];
               register double a2 = a[(i+1)*n + k];
               register double a3 = a[i*n + k+1];
               register double a4 = a[(i+1)*n + k+1];
               register double b1 = b[k*n + j];
               register double b2 = b[(k+1)*n + j];
               register double b3 = b[k*n + (j+1)];
               register double b4 = b[(k+1)*n + (j+1)];
                 c1  = a1*b1 + a3*b2 + c1;
                  c2 = a2*b1 + a4*b2 + c2;
                  c3   = a1*b3 + a3*b4
                     + c3;
                  c4= a2*b3 + a4*b4 + c4;

         }
      }
   }
}
void matrix_vector_multiply2(long long *C, long long *A, long long *B, long long n) {
   long long i, j,k;
for ( i=0; i<n; i++ )
     for ( j=0; j<n; j++ ) {
          register double t=C[i*n+j];
          for ( k=0; k<n; k++ )
                t+=A[i*n+k]*B[k*n+j];
          C[i*n+j]=t;
    }

}

void matrix_vector_multiply3(long long *C, long long *A, long long *B, long long n) {
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
   long long *z = (long long *)malloc(sizeof(long long) * size*size);
   long long i, j;
   //printf("9");
   for (i = 0; i < size; ++i)
      for (j = 0; j < size; j++)
         A[i*size + j] = j;

   for (i = 0; i < size; ++i)
      x[i] = i;

   //printf("%d\n",42
   clock_t begin = clock();

   matrix_vector_multiply2(y, A, x, size);
   clock_t end = clock();
clock_t begin2 = clock();
   matrix_vector_multiply3(z, A, x, size);
clock_t end2 = clock();
   unsigned int errors = 0;
   for(int i = 0; i < size;i++){
      for(int j = 0; j < size; j++){
         if(y[i*size + j] != z[i * size + j]){
            errors++;
         }
      }
   }

   double time_spent = (double)(end -  begin) / CLOCKS_PER_SEC -
                        (double)(end2 -  begin2) / CLOCKS_PER_SEC;
   //printf("%d\n",52);
   printf("passed(%f)\n%d",time_spent,errors); // time saved
   free(A);
   free(x);
   free(y);

   return 0;
}

