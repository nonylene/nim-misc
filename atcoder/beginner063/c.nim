import strutils
import algorithm
import math

let N = stdin.readLine.parseInt

var ss: seq[int] = @[]
for i in 0..<N:
  ss.add(stdin.readLine.parseInt)

let total = sum(ss)

if total mod 10 != 0:
  echo total
  quit 0

sort(ss, system.cmp)

for i in ss:
  if i mod 10 == 0:
    continue
  else:
    echo total - i
    quit 0

echo 0
