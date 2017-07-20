# saw answer

import strutils
import algorithm
import sequtils
import math
from future import `=>`
import tables

let N = stdin.readLine.parseInt
let S = stdin.readLine.parseInt


proc calc(num: int64, base: int64): int64 =
  if num < base:
    return num
  else:
    let adding = num mod base
    return calc(num div base, base) + adding


for b in 2..max(sqrt(N.toFloat).toInt,2):
  let s = calc(N, b)
  if s == S:
    echo b
    quit()

# -> B * a + b = N
# -> a + b = S
# -> 1. a < sqrt(N)

for a in countdown(min(sqrt(N.toFloat).toInt - 1, S), 1):
  if ((N - S) mod a) == 0:
    let B = (N - S + a) div a
    if B > 1 and S - a < B:
      # echo a
      # echo S - a
      echo B
      quit()

if N == S:
  echo N + 1
  quit()


echo -1
