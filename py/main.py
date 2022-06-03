from typing import List

def euclid(cnt: int) -> List[int]:
  def prod(list: List[int]) -> int:
    ans = list[0]
    for i in range(1,len(list)):
      ans *= list[i]
    return ans

  def find_smallest_prime_factor(n: int) -> int:
    # start from 3; we dont care about 2 here, because n is always odd
    i = 3
    # increment by 2 every step until you reach sqrt(n)
    while i * i <= n:
      # if i divides n, return that as the smallest prime factor
      if (n % i == 0):
        return i
      i += 2

    # otherwise, n itself is a prime
    return n

  # initial prime set is just [2]
  primes: List[int] = [2]
  while (len(primes) < cnt):
    # generate the new number. note that this number is always odd
    n: int = prod(primes) + 1 
    # find the smallest prime factor of this number
    q: int = find_smallest_prime_factor(n)
    # add it to the list of primes
    primes.append(q)
    
  return primes
    
print("Primes:",euclid(10))