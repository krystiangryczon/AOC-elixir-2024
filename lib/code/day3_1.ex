defmodule Advent.Code3_1 do
  def run(input) do
    Regex.scan(~r/mul\(\d{1,3},\d{1,3}\)/, input)
    |> Enum.flat_map(& &1)
    |> Enum.map(&String.split(&1, ~r/[mul\(\),]/, trim: true))
    |> Enum.map(fn l -> Enum.map(l, &String.to_integer/1) end)
    |> Enum.map(&Enum.product/1)
    |> Enum.sum()
  end
end
