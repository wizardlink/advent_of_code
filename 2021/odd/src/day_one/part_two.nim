#[
  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at https://mozilla.org/MPL/2.0/.
]#

import std/sequtils

func execPartTwo* (input: seq[int]): int =
  result = 0

  var groups: seq[seq[int]]
  for index in 0..input.len - 3:
    groups.add @[input[index], input[index+1], input[index+2]]

  var summedGroups = groups.map proc(x: seq[int]): int = return x.foldl(a + b)
  for index in 1..summedGroups.len-1:
    if summedGroups[index] > summedGroups[index-1]:
      result += 1
