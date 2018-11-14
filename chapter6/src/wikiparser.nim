import re
import parseutils
import os

let pattern = re"([^\s]+)\s([^\s]+)\s(\d+)\s(\d+)"

var line = "en Nim_(programming_language) 1 70231"
var matches: array[4, string]
let start = find(line, pattern, matches)

doAssert start == 0
doAssert matches[0] == "en"
doAssert matches[1] == "Nim_(programming_language)"
doAssert matches[2] == "1"
doAssert matches[3] == "70231"

var i = 0
var domainCode = ""
i.inc parseUntil(line, domainCode, {' '}, i)
i.inc
var pageTitle = ""
i.inc parseUntil(line, pageTitle, {' '}, i)
i.inc
var countViews = 0
i.inc parseInt(line, countViews, i)
i.inc
var totalSize = 0
i.inc parseInt(line, totalSize, i)

doAssert domainCode == "en"
doAssert pageTitle == "Nim_(programming_language)"
doAssert countViews == 1
doAssert totalSize == 70231

proc readPageCounts(filename: string) =
  for line in filename.lines:
    echo(line)

when isMainModule:
  const file = "pagecounts-20160101-050000"
  let filename = getCurrentDir() / file
  readPageCounts(filename)
