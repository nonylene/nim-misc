import strutils
import algorithm
import sequtils
import math
from future import `=>`
import tables

let S = stdin.readLine

var sum = 0.toBiggestInt

let s_length = len(S)

for lngth in 1..s_length:
  # for end
  let toori_edge = max(1, pow(2.toFloat, s_length.toFloat - lngth.toFloat - 1.0)).toBiggestInt
  let toori = pow(2.toFloat, s_length.toFloat - lngth.toFloat - 2.0).toBiggestInt

  let owari = s_length - lngth
  for start in 0..owari:
    if start == 0 or start == owari:
      sum += S[start ..< start + lngth].parseInt * toori_edge
    else:
      sum += S[start ..< start + lngth].parseInt * toori

echo sum
