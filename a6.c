#include "omp.h"

 void axpy(int N, float *Y, float *X, float a) {
     int i;
     #pragma omp target update to(X)
     #pragma omp parallel for
     for (i = 0; i < N; ++i)
         Y[i] += a * X[i];
  }
