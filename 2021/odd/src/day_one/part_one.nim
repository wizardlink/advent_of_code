#[
  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at https://mozilla.org/MPL/2.0/.
]#

func execPartOne* (input: seq[int]): int =
  result = 0 # Initialises an integer result

  for index in 1..input.len-1:
    let value = input[index]
    let previousValue = input[index-1]

    if value > previousValue:
      result += 1
