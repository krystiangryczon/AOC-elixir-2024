defmodule AdventOfCode.Day01Test do
  use ExUnit.Case
  import My.Utils, only: [get_test_input: 2]
  import AdventOfCode.Day01

  @test_inp_small """
  3   4
  4   3
  2   5
  1   3
  3   9
  3   3
  """
  test "part1" do
    input = get_test_input(@test_inp_small, 1)
    result = part1(input)

    assert result == 11
  end

  test "part2" do
    input = get_test_input(@test_inp_small, 1)
    result = part2(input)

    assert result == 31
  end
end
