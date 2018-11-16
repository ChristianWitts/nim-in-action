import macros

macro calculate(): int =
  result = newStmtList(
    infix(
      newIntLitNode(5),
      "*",
      newPar(
        infix(
          newIntLitNode(5),
          "+",
          newIntLitNode(10)
        )
      )
    )
  )

echo(calculate())

macro arguments(number: int, unknown: untyped): untyped =
  result = newStmtList()
  echo number.treeRepr()
  echo unknown.treeRepr()

arguments(71, ["12", "89"])
