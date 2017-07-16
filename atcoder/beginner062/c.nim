import strutils
import algorithm
import sequtils
import math
from future import `=>`

let ints = stdin.readLine.split(' ').map(parseInt)

let
  H = ints[0]
  W = ints[1]

# vertical split

let v = if W mod 3 == 0: 0 else: H

# horizontal split

let h = if H mod 3 == 0: 0 else: W

proc red(pt: int, h: int, w: int): int =
  return ((H + 1) * W / 2 - (3 * H / 2 + 1 / 2) * pt.toFloat()).toInt()

proc green(pt: int, h: int, w: int): int =
  return (- (h - 1) * w / 2 + (3 * h / 2 - 1 / 2) * pt.toFloat).toInt()

proc blue(pt: int, h: int, w: int): int =
  return w - pt

proc resolve(h: int, w: int): int =
  if h mod 2 == 0:
    return h div 2
  else:
    # point
    #   | 
    #   | A
    # C |---
    #   | B

    # blue -> diff between A and B
    # green -> diff between B and C
    # red -> diff between A and C

    # green up line -> - (h - 1) w / 2 + (3 h / 2 - 1 / 2) point
    # red down line -> (h + 1) w / 2 - (3 h / 2 + 1 / 2) point
    # blue line -> w - point
    # red * green -> i = w / 3
    # blue * green -> i = w * (h / 2 + 1 / 2) / (3 h / 2 + 1 / 2)

    let redgreen = w / 3
    let candidate_redgreen_red = red(floor(redgreen).toInt(), h, w)
    let candidate_redgreen_green =  green(ceil(redgreen).toInt(), h, w)
    let bluegreen = w.toFloat() * (h / 2 + 1 / 2) / (3 * h / 2 + 1 / 2)
    let candidate_bluegreen_blue = blue(floor(redgreen).toInt(), h, w)
    let candidate_bluegreen_green =  green(ceil(redgreen).toInt(), h, w)

    if floor(redgreen) == floor(bluegreen):
      return min(max(candidate_redgreen_red, candidate_bluegreen_blue), candidate_redgreen_green)
    elif floor(redgreen)  > floor(bluegreen):
      return min(candidate_redgreen_red, candidate_redgreen_green)
    else:
      return min(candidate_bluegreen_blue, candidate_bluegreen_green)

#    C
# ------
#  A | B

#   | 
#   | A
# C |---
#   | B
  
let a = min(resolve(H, W), resolve(W, H))

echo(min(@[h, v, a]))
