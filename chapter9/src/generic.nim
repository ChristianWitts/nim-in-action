proc myMax[T: int | float](a, b: T): T =
  if a < b:
    return b
  return a

doAssert myMax(5, 10) == 10
doAssert myMax(31.3, 1.23124) == 31.3

type
  Container[T] = object
    empty: bool
    value: T

proc initContainer[T](): Container[T] =
  result.empty = true

var myBox = initContainer[string]()

type
  Number = int | float | uint

proc isPositive(x: Number): bool =
  return x > 0

doAssert isPositive(7) == true
doAssert isPositive(-9.3) == false

type
  Comparable = concept a
    (a < a) is bool

proc myMaxAny(a, b: Comparable): Comparable =
  if a < b:
    return b
  return a

doAssert myMaxAny("Hello", "World") == "World"
doAssert myMaxAny(5, 10) == 10
