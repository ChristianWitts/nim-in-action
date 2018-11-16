import os

template repeatN(count: int, statements: untyped) =
  for i in 0..<count:
    statements

template repeat(statements: untyped) =
  while true:
    statements

template declareVar(varName: untyped, value: typed) =
  var varName = value

declareVar(foo, 42)
echo(foo)

template hygiene(varName: untyped) =
  var varName = 42
  var notInjected = 128
  var injected {.inject.} = notInjected + 2

hygiene(injectedImplicitly)

doAssert(injectedImplicitly == 42)
doAssert(injected == 130)

repeatN 3:
  echo("Hello finite repeat")
  sleep(100)

repeat:
  echo("Hello templates")
  sleep(1000)
