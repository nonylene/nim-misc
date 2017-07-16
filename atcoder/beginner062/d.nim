# import nimprof

import strutils
import algorithm
import sequtils
import math
from future import `=>`

type
  BinaryHeapObj[T] = object
    values: seq[T]
    cmp: proc(a, b: T): int
  BinaryHeap*[T] = ref BinaryHeapObj[T]

proc newBinaryHeap*[T](init: T, cmp: proc(a, b: T): int): BinaryHeap[T] =
  return BinaryHeap[T](values: @[cast[T](nil), init], cmp: cmp)

proc left_position(position: int): int = position * 2
proc right_position(position: int): int = position * 2 + 1
proc parent_position(position: int): int = position div 2

proc exists[T](heap: BinaryHeap[T], position: int): bool =
  return heap.values.len > position

proc left_exists*[T](heap: BinaryHeap[T], position: int): bool =
  return heap.values.len > left_position(position)
proc right_exists*[T](heap: BinaryHeap[T], position: int): bool =
  return heap.values.len > right_position(position)

proc left*[T](heap: BinaryHeap[T], position: int): T = 
  return heap.values[left_position(position)]
proc right*[T](heap: BinaryHeap[T], position: int): T = 
  return heap.values[right_position(position)]
proc parent*[T](heap: BinaryHeap[T], position: int): T = 
  return heap.values[parent_position(position)]

proc swap_node(heap: BinaryHeap, a: int, b: int) =
  swap(heap.values[a], heap.values[b])

proc cmp_node(heap: BinaryHeap, parent: int, child: int): bool =
  let cmped = heap.cmp(
      heap.values[parent], heap.values[child]
    ) 

  return cmped >= 0

proc check_and_replace[T](heap: BinaryHeap[T], parent: int, child: int): bool =
  if heap.exists(child):
    result = not heap.cmp_node(parent, child)
    if result:
      heap.swap_node(parent, child)
  else:
    return false

proc pop*[T](heap: BinaryHeap[T]): T =
  result = heap.values[1]
  heap.values[1] = heap.values.pop()

  proc fix_node(heap: BinaryHeap, position: int) =
    let left_pos = left_position(position)
    let right_pos = right_position(position)
    var left: bool
    if heap.exists(left_pos):
      if heap.exists(right_pos):
        left = heap.cmp_node(left_pos, right_pos)
      else:
        left = true
    else:
      left = false

    let replace = if left: left_pos else: right_pos
    if heap.check_and_replace(position, replace):
      heap.fix_node(replace)

  heap.fix_node(1)


proc add*[T](heap: BinaryHeap[T], item: T) =
  heap.values.add(item)
  var position = heap.values.len - 1
  while position > 1:
    let parent = parent_position(position)
    if heap.check_and_replace(parent, position):
      position = parent
    else:
      break

proc `$`*(heap: BinaryHeap): string =
  proc dump(heap: BinaryHeap, position: int): string =
    let left = if not heap.left_exists(position): "nil" else: heap.dump(left_position(position))
    let right = if not heap.right_exists(position): "nil" else: heap.dump(right_position(position))
    return "(" & $ heap.values[position] & ", " & left & ", " & right & ")"

  return heap.dump(1)

let N = stdin.readLine.parseInt()
let A_LIST = stdin.readLine.split(' ').map(parseInt)
 
let part1 = A_LIST[0..<N]
let part2 = A_LIST[N..<N*2]
let part3 = A_LIST[N*2..<N*3]
 
# import deques
 
# var 
#   part1_ascend = initDeque[int]()
#   part3_descend = initDeque[int]()
#   part2_ascend = initDeque[int]()
 
let part1_tree = newBinaryHeap(part1[0], (a: int, b: int) => cmp(b, a))
for i in part1[1..<N]:
  part1_tree.add(i)
var part1_sum = sum(part1)

let part3_tree = newBinaryHeap(part3[0], system.cmp)
for i in part3[1..<N]:
  part3_tree.add(i)

var part3_sum = sum(part3)
 
var part1_sums = @[part1_sum]
var part3_sums = @[part3_sum]

for i in 0..<N:

  let val = part2[i] 
  part1_tree.add(val)
  part1_sum += val - part1_tree.pop()
  part1_sums.add(part1_sum)

  let val3 = part2[N-i-1] 
  part3_tree.add(val3)
  part3_sum += val3 - part3_tree.pop()
  part3_sums.add(part3_sum)

echo max(zip(part1_sums, reversed(part3_sums)).map((ab) => ab.a - ab.b))
