defmodule Advent.Code1_1 do
  alias My.Utils

  def run(input) do
    with [l1, l2] <-
           input
           |> Enum.map(&String.split(&1, ~r/[\s]+/))
           |> Enum.zip()
           |> Enum.map(&Tuple.to_list/1),
         l1_sorted <- Enum.sort(l1) |> Enum.map(&Utils.string_to_num_or_false/1),
         l2_sorted <- Enum.sort(l2) |> Enum.map(&Utils.string_to_num_or_false/1) do
      l1_sorted
      |> Enum.zip(0..length(l1_sorted))
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
