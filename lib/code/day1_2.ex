defmodule Advent.Code1_2 do
  def run(input) do
    with [l1, l2] <-
           input
           |> Enum.map(&String.split(&1, ~r/[\s]+/))
           |> Enum.zip()
           |> Enum.map(&Tuple.to_list/1),
         l1_int <- Enum.map(l1, &String.to_integer/1),
         l2_int <- Enum.map(l2, &String.to_integer/1),
         l2_freq <- Enum.frequencies(l2_int) do
      l1_int
      |> Enum.reduce(0, fn x, acc -> acc + x * (l2_freq[x] || 0) end)
    else
      err -> err
    end
  end
end
