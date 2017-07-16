import strutils
import sequtils

let ints = stdin.readLine.split(' ').map(parseInt)
let
  a = ints[0]
  b = ints[1]

let r =  a + b

if r > 9:
  echo "error"
else:
  echo r
