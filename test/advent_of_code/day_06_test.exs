defmodule AdventOfCode.Day06Test do
  use ExUnit.Case
  import My.Utils, only: [get_test_input: 2]
  import AdventOfCode.Day06

  @test_input """
  ....#.....
  .........#
  ..........
  ..#.......
  .......#..
  ..........
  .#..^.....
  ........#.
  #.........
  ......#...
  """

  @tag :current
  test "part1" do
    input = get_test_input(@test_input, 6)
    result = part1(input)

    assert result == 41
  end

  @tag :skip
  test "part2" do
    input = get_test_input(@test_input, 6)
    result = part2(input)

    assert result == 71503
  end
end
