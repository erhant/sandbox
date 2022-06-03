#include <stdio.h>
#include <stdbool.h>

#define P 100

int main() {
  unsigned int p = 0;
  unsigned int primes[P] = {0};
  unsigned int composites[P] = {0};
  bool eq;

  for (unsigned int n = 2; p < P; n++) {
    eq = false; // reset flag

    #pragma omp parallel for
    for (unsigned int i = 0; i < p; i++) {
      unsigned int tmp = composites[i]; // read to reduce memory access
      if (tmp < n)
        tmp += primes[i];
      if (tmp == n)
        eq = true;
      composites[i] = tmp; // write back
    }

    if (!eq) {
      primes[p] = n;
      composites[p] = n;
      p++;
    }

  }

  // done, you can print primes
  for (int i = 0; i < P; i++)
    printf("%d ", primes[i]);

}