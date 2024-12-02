defmodule AdventOfCode.Day02Test do
  use ExUnit.Case
  import My.Utils, only: [get_test_input: 2]
  import AdventOfCode.Day02

  @test_inp_small """
  7 6 4 2 1
  1 2 7 8 9
  9 7 6 2 1
  1 3 2 4 5
  8 6 4 4 1
  1 3 6 7 9
  """

  test "part1" do
    input = get_test_input(@test_inp_small, 2)
    result = part1(input)

    assert result == 2
  end

  test "part2" do
    input = get_test_input(@test_inp_small, 2)
    result = part2(input)

    assert result == 4
  end

  @my_test_inp """
  7 6 4 2 1
  1 2 7 8 9
  9 7 6 2 1
  1 3 2 4 5
  8 6 4 4 1
  1 3 6 7 9
  10 12 14 11 12 14 14
  13 16 17 19 16 15
  3 5 8 11 11 15
  10 11 9 8 6 5
  1 1 2 3
  10 8 7 6 12
  1 3 2 3 4 5
  """

  # true
  # false
  # false
  # true
  # true
  # true
  # false
  # false
  # false
  # true
  # true
  # true
  # true

  @tag :skip
  test "part2_my_test" do
    input = get_test_input(@my_test_inp, 2)
    result = part2(input)

    assert result == [
             true,
             false,
             false,
             true,
             true,
             true,
             false,
             false,
             false,
             true,
             true,
             true,
             true
           ]
  end
end
