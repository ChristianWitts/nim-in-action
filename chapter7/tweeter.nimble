# Package

version       = "0.1.0"
author        = "Christian Witts"
description   = "A simple Twitter clone"
license       = "MIT"
srcDir        = "src"
bin           = @["tweeter"]
skipExt       = @["nim"]


# Dependencies

requires "nim >= 0.19.0"
requires "jester >= 0.0.1"
