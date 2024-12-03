defmodule Advent.Code3_2 do
  defp exec(mul_str) do
    mul_str
    |> String.split(~r/[mul\(\),]/, trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.product()
  end

  defp sum_when_do([], acc, _should_add?), do: acc

  defp sum_when_do(["do()" | rest], acc, _should_add?), do: sum_when_do(rest, acc, true)
  defp sum_when_do(["don't()" | rest], acc, _should_add?), do: sum_when_do(rest, acc, false)
  defp sum_when_do([h | rest], acc, true), do: sum_when_do(rest, acc + exec(h), true)
  defp sum_when_do([_h | rest], acc, false), do: sum_when_do(rest, acc, false)

  def run(input) do
    Regex.scan(~r/mul\(\d{1,3},\d{1,3}\)|do\(\)|don\'t\(\)/, input)
    |> Enum.flat_map(& &1)
    |> sum_when_do(0, true)
  end
end
