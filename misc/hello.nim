
echo "hello, world!"
var name = "fugafuga"
echo "Hi, ", name, ""
echo "hi"
echo r"u\\::::::::\a;\;"
# echo "u\\::::::::\a;\;"
echo """aa
djsalf
fjlafas
"""

#[
  comment~~~~
  #[
    comment~~~
  ]#
]#

discard "hogehoge"
echo 1_000_0000_000
# 0
var
  x, y: int
  # a, b, c : string

x = 0
x = 2
x = 3
echo "x ", x
x = 42
echo "x ", x

const g = 2342
let a = 234
# a = 2

if g == 2:
  echo "haha"
else:
  echo "ok"

var s = case g
  of 0..2: "a"
  else: "b"

for i in countup(0,1):
  echo $i

for i in 0..1:
  echo i

for i in 0..<1:
  echo i

var i  = 0
while i < 2:
  var x = 2
  i = i+1

block:
  var x = 2

if x == 2 and
   x  == 3:
  echo "hohohoho"

const fac4 = (var p = 1; for i in 1..4: p *= i; p)

proc hoge(fuca: string; uooo = 2): bool = 
  return true

discard hoge "a"

proc piyo(x: var string): int {.discardable.} =
  x = "hohohhohohh"
  result = result + 1

var k = ""
piyo k

# forward declaration:
proc even(n: int): bool

proc odd(n: int): bool =
  assert(n >= 0) # makes sure we don't run into negative recursion
  if n == 0: false
  else:
    n == 1 or even(n-1)

proc even(n: int): bool =
  assert(n >= 0) # makes sure we don't run into negative recursion
  if n == 1: false
  else:
    n == 0 or odd(n-1)

echo 'a'

echo "ああああああ"[0]

import unicode
echo "ああ".runeLen
echo "ああ".toRunes[0]

type 
  Direction = enum
    north, east, south, west

var xx = east
echo xx

echo high(int)

let xss = [1, 2, 3]
echo repr(xss)

for i in xss:
  echo i

var jflkaj = "ああああああああ----ーーー"
echo jflkaj[1]
echo jflkaj.toRunes[1]

type
  Person = ref object of RootObj
    name*: string  # the * means that `name` is accessible from other modules
    age: int  

  Student = ref object of Person
    id: int

  Person1 = object of RootObj
    name*: string  # the * means that `name` is accessible from other modules
    age: int  

  Student1 = object of Person1
    id: int

let person = Person(name: "fuga", age: 2)
echo person[]

let student: Person = Student(id: 5, name: "a") 
let ffff = cast[Student](student)
echo student[]
echo ffff[]
echo Student(student)[]

let student1: Person1 = Student1(id: 5, name: "s") 

type
  Node = ref NodeObj
  NodeObj = object
    le, ri: Node
    sym: ref Sym
  
  Sym = object
    name: string
    line: int
    code: Node

echo len("a")
echo ({'a','b','c',}.card)

# proc complexProc() {.raises: [IOError, ArithmeticError].} =
#   raise newException(IOError, "a")
#   # discard

# complexProc()

import macros

dumpTree:
  const cfgversion: string = "1.1"
  const cfglicenseOwner= "Hyori Lee"
  const cfglicenseKey= "M1Tl3PjBWO2CC48m"

proc echoHW() =
  echo "Hello world"
proc echoHW0() =
  echo "Hello world 0"
proc echoHW1() =
  echo "Hello world 1"

template joinSymbols(a, b: untyped): untyped =
  `a b`()

joinSymbols(echo, HW)

`echo HW`()
