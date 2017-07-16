import strutils
import algorithm
import sequtils
import math
from future import `=>`

type 
  Group = enum
    First
    Second
    Third

proc grouping(val: int): Group =
  case val:
    of 1, 3, 5, 7, 8, 10, 12: result = First
    of 4, 6, 9, 11: result = Second
    of 2: result = Third
    else: raise newException(ValueError, "")

let ints = stdin.readLine.split(' ').map(parseInt)

let
  x = ints[0]
  y = ints[1]

if grouping(x) == grouping(y):
  echo "Yes"
else:
  echo "No"
