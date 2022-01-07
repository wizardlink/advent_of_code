# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

defmodule Util do
  @doc """
  Transforms a regex's result into an integer
  """
  def regex_to_integer(regex, input) do
    [result | _] = Regex.run(regex, input)

    String.to_integer(result)
  end
end

defmodule Submarine do
  @doc """
  Moves the submarine starting from the given positions.
  """
  def move(startPosition, startDepth) do
    movements = read_movements()

    position = fold_movement_list(movements[:forward], startPosition, &forward/2)
    depth = fold_movement_list(movements[:up], startPosition, &surface/2) + fold_movement_list(movements[:down], startPosition, &submerge/2)

    position * depth
  end

  @doc """
  Reads all the movements of the submarine.
  """
  def read_movements do
    input = File.read!("../input.txt")
    trimmedInput = String.trim(input)

    movements = String.split(trimmedInput, ~r/\R/)

    %{:forward => Enum.filter(movements, fn m -> String.match?(m, ~r/^forward\s?(\d)/) end),
      :up => Enum.filter(movements, fn m -> String.match?(m, ~r/^up\s?(\d)/) end),
      :down => Enum.filter(movements, fn m -> String.match?(m, ~r/^down\s?(\d)/) end)}
  end

  @doc """
  Folds the movement list into an integer value using the passed function
  """
  def fold_movement_list(list, startPosition, function) do
    List.foldl(list, startPosition, fn mov, acc -> function.(acc, Util.regex_to_integer(~r/\d/, mov)) end)
  end

  @doc """
  Gives the position of the submarine when moving forward X units.
  """
  def forward(currentPos, amount) do
    currentPos + amount
  end

  @doc """
  Gives the position of the submarine when moving upwards X units.
  """
  def surface(currentDepth, amount) do
    currentDepth - amount
  end

  @doc """
  Gives the position of the submarine when moving downwards X units.
  """
  def submerge(currentDepth, amount) do
    currentDepth + amount
  end
end

IO.puts(Submarine.move(0, 0))
