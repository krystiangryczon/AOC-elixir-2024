defmodule Advent.Code1_1 do
  def run(input) do
    with [l1, l2] <-
           input
           |> Enum.map(&String.split(&1, ~r/[\s]+/))
           |> Enum.zip()
           |> Enum.map(&Tuple.to_list/1),
         l1_sorted <- Enum.sort(l1) |> Enum.map(&String.to_integer/1),
         l2_sorted <- Enum.sort(l2) |> Enum.map(&String.to_integer/1) do
      l1_sorted
      |> Enum.with_index()
      |> Enum.reduce(0, fn {x, idx}, acc ->
        acc +
          abs(
            x -
              Enum.at(l2_sorted, idx)
          )
      end)
    else
      err -> err
    end
  end
end
