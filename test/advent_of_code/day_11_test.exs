defmodule AdventOfCode.Day11Test do
  use ExUnit.Case

  import AdventOfCode.Day11

  def test_input,
    do: """
    ...#......
    .......#..
    #.........
    ..........
    ......#...
    .#........
    .........#
    ..........
    .......#..
    #...#.....
    """

  @tag :skip
  test "part1" do
    input = test_input()
    result = part1(input)

    assert result == 374
  end

  @tag :skip
  test "part2" do
    input = test_input()
    result = part2(input)

    assert result == 82_000_210
  end
end
