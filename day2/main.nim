import strutils, sequtils

block:
  let f = open("input.txt", fmRead)
  var words = split(f.readAll().strip(), ',').map(parseInt)
  f.close()
  words[1] = 12
  words[2] = 2
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

block time:
  let f = open("input.txt", fmRead)
  defer: f.close()

  for i in 1 .. 99:
    for j in 1 .. 99:
      var count = 0
      f.setFilePos(0)
      var words = split(f.readAll().strip(), ',').map(parseInt)
      words[1] = i
      words[2] = j
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
      if words[0] == 19690720:
        echo words[1], "->",words[2]
        break time



