defmodule Advent.Code3_2 do
  defp exec(mul_str) do
    mul_str
    |> String.split(~r/[mul\(\),]/, trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.product()
  end

  defp sum?([], acc, _add?), do: acc

  defp sum?(["do()" | rest], acc, _add?), do: sum?(rest, acc, :do)
  defp sum?(["don't()" | rest], acc, _add?), do: sum?(rest, acc, :dont)
  defp sum?([h | rest], acc, :do), do: sum?(rest, acc + exec(h), :do)
  defp sum?([_ | rest], acc, :dont), do: sum?(rest, acc, :dont)

  def run(input) do
    ~r/mul\(\d{1,3},\d{1,3}\)|do\(\)|don\'t\(\)/
    |> Regex.scan(input)
    |> Enum.flat_map(& &1)
    |> sum?(0, :do)
  end
end
