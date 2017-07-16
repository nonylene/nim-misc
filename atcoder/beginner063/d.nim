# saw answer!!!

import strutils
import algorithm
import sequtils
import math
from future import `=>`

let ints = stdin.readLine.split(' ').map(parseInt)
let
  N = ints[0]
  A = ints[1]
  B = ints[2]

var hs: seq[int] = @[]
for i in 0..<N:
  hs.add(stdin.readLine.parseInt)

sort(hs, system.cmp, SortOrder.Descending)

var max = sum(hs) div B
var min = hs[0] div A

while min != max:
  let current = (max + min) div 2
  let base = B * current
  let no_base_seq = filter(map(hs, (v) => v - base), (v) => v > 0)

  var cul = current

  var ok = true

  if no_base_seq.len != 0:
    for v in no_base_seq:
      cul -= ceil(v / (A-B)).toInt
      if cul < 0:
        ok = false
        break

  if ok:
    max = current
  else:
    min = current + 1

echo max
