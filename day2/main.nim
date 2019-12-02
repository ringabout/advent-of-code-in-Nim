import strutils, sequtils

block:
  let f = open("input.txt", fmRead)
  var words = split(f.readAll().strip(), ',').map(parseInt)
  var count = 0
  while true:
    let value = words[count]
    case value:
    of 1:
      let
        left = words[words[count+1]]
        right = words[words[count+2]]
      words[words[count+3]] = left+right
    of 2:
      let
        left = words[words[count+1]]
        right = words[words[count+2]]
      words[words[count+3]] = left*right
    of 99:
      break
    else:
      raise newException(ValueError, "error")
    count += 4

  doassert words[0] == 12490719