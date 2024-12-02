defmodule Advent.Code2_2 do
  import Advent.Code2_1, only: [check: 3]

  defp brute_force_check(list) do
    list
    |> Enum.with_index()
    |> Enum.map(fn {_, idx} ->
      [h | rest] = List.delete_at(list, idx)

      order =
        case h > Enum.at(rest, length(rest) - 1) do
          true -> :desc
          false -> :asc
        end

      check(rest, h, order)
    end)
    |> Enum.any?(&(!!&1))
  end

  def run(input) do
    input
    |> Enum.map(fn x ->
      String.split(x, " ")
      |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.filter(&brute_force_check/1)
    |> length()
  end
end
