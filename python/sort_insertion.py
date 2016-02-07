#!/bin/python

import random

def insertionSort(ar): 
    for i in range(1, len(ar)):
        for j in range(0, len(ar)):
            if i == j: break
            if ar[i] <= ar[j]:
                buf = ar[i]
                ar[j+1:i+1] = ar[j:i]
                ar[j] = buf
                break
                
    return ar

ar = [random.randint(0,1000) for r in xrange(100)]
print insertionSort(ar)
