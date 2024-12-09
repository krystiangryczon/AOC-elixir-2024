defmodule AdventOfCode.Day09Test do
  use ExUnit.Case
  import My.Utils, only: [get_test_input: 2]
  import AdventOfCode.Day09

  @test_input "2333133121414131402"

  test "part1" do
    input = get_test_input(@test_input, 9)
    result = part1(input)

    assert result == 1928
  end

  test "part2" do
    input = get_test_input(@test_input, 9)
    result = part2(input)

    assert result == 2858
  end
end
