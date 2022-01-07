#[
  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at https://mozilla.org/MPL/2.0/.
]#

import std/[sequtils, strutils, strformat]
import day_one/[part_one, part_two]

const inputFile = slurp("/mnt/internal/personal/projects/advent_of_code/2021/odd/input.txt")

func isNumber (input: string): bool =
  try:
    discard parseInt(input)
    return true
  except:
    return false

func convertInputToIntSequence (input: string): seq[int] =
  return input.split('\n').filter(isNumber).map parseInt

func main (): string =
  return &"Part one: {execPartOne convertInputToIntSequence(inputFile)}\nPart two: {execPartTwo convertInputToIntSequence(inputFile)}"

when isMainModule:
  echo main()
