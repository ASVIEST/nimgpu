import std/parseutils

proc skipUntil*(s: string, until: string): int=
  var tmp: string
  s.parseUntil(tmp, until)

proc withSkipUntil*(s: string, until: string): string=
  let idx = s.skipUntil(until)
  s[idx..^1]

proc cropBetween*(s: string, lBound, rBound: string): string=
  let
    idxLeft  = s.skipUntil(lBound) - 1
    idxRight = s[idxLeft..^1].skipUntil(rBound)

  s[0..idxLeft] & s[idxLeft + idxRight - 1..^1]
