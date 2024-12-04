defmodule AdventOfCode.Day04Test do
  use ExUnit.Case
  import My.Utils, only: [get_test_input: 2]
  import AdventOfCode.Day04

  @test_input_small """
  MMMSXXMASM
  MSAMXMSMSA
  AMXSXMAAMM
  MSAMASMSMX
  XMASAMXAMM
  XXAMMXXAMA
  SMSMSASXSS
  SAXAMASAAA
  MAMMMXMMMM
  MXMXAXMASX
  """

  test "part1" do
    input = get_test_input(@test_input_small, 4)
    result = part1(input)

    assert result == 18
  end

  test "part2" do
    input = get_test_input(@test_input_small, 4)
    result = part2(input)

    assert result == 9
  end

  @test_input_small_wrap """
  SAS
  S.S
  MSM
  """

  test "part2_wrap" do
    input = get_test_input(@test_input_small_wrap, 4)
    result = part2(input)

    assert result == 0
  end
end
