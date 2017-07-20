import strutils
import algorithm
import sequtils
import math
from future import `=>`
import tables

let ints = stdin.readLine.split(' ').map(parseInt)
let 
   N = ints[0]
   A = ints[1]

let x_s = stdin.readLine.split(' ').map(parseInt)

let diffs = x_s.map((x) => x - A)

var diff_table = initCountTable[int]()

for x in diffs:
  for kv in toSeq(diff_table.pairs):
    diff_table.inc(kv[0] + x, kv[1])
  diff_table.inc(x)

echo diff_table.getOrDefault(0)
