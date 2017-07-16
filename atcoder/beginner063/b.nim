import sequtils

let base = ord('a')
var arr = false.repeat(ord('z') - base + 1)

for i in stdin.readLine:
  let n = ord(i) - base
  if arr[n]:
    echo "no"
    quit 0
  else:
    arr[n] = true

echo "yes"
