defmodule AdventOfCode.Day03Test do
  use ExUnit.Case
  import My.Utils, only: [get_test_input: 2]
  import AdventOfCode.Day03

  @test_inp_small """
  xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))
  """

  test "part1" do
    input = get_test_input(@test_inp_small, 3)
    result = part1(input)

    assert result == 161
  end

  @test_inp_small_p2 """
  xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))
  """

  test "part2" do
    input = get_test_input(@test_inp_small_p2, 3)
    result = part2(input)

    assert result == 48
  end
end
