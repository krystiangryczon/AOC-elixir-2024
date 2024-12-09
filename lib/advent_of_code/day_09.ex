defmodule AdventOfCode.Day09 do
  def part1(input) do
    [inp] = My.Utils.split_file(input)
    Advent.Code9_1.run(inp)
  end

  def part2(input) do
    [inp] = My.Utils.split_file(input)
    Advent.Code9_2.run(inp)
  end
end
