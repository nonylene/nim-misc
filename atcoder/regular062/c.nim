import strutils
import algorithm
import sequtils
import math
from future import `=>`

let N = stdin.readLine.parseInt

var result = (votes_t: 1, votes_a: 1)

for i in 0..<N:
  let
    ta = stdin.readLine.split(' ').map(parseInt)
    T = ta[0]
    A = ta[1]

  let 
    t2 = result.votes_t / T
    a2 = result.votes_a / A

  var next: int
  # remove error
  if t2 > a2:
    next = result.votes_t div T + (if result.votes_t mod T != 0: 1 else: 0)
  else:
    next = result.votes_a div A + (if result.votes_a mod A != 0: 1 else: 0)
  result = (votes_t: (next * T), votes_a: (next * A))

echo result.votes_t + result.votes_a
