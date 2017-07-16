import strutils
import algorithm
import sequtils
import math
from future import `=>`

let ints = stdin.readLine.split(' ').map(parseInt)

let
  H = ints[0]
  W = ints[1]

echo "#".repeat(W + 2)

for i in 0..<H:
  stdout.write('#')
  stdout.write(stdin.readLine())
  stdout.write("#\n")

echo "#".repeat(W + 2)
