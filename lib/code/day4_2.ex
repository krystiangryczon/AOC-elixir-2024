defmodule Advent.Code4_2 do
  import My.Utils, only: [bti: 1]

  defp at(matrix, row, col) do
    row = Enum.at(matrix, row)

    cond do
      col < 0 -> nil
      row < 0 -> nil
      is_nil(row) -> nil
      true -> Enum.at(row, col)
    end
  end

  defp check(matrix, row, col) do
    ((at(matrix, row + 1, col + 1) == "S" && at(matrix, row - 1, col - 1) == "M") ||
       (at(matrix, row + 1, col + 1) == "M" && at(matrix, row - 1, col - 1) == "S")) &&
      ((at(matrix, row + 1, col - 1) == "S" && at(matrix, row - 1, col + 1) == "M") ||
         (at(matrix, row + 1, col - 1) == "M" && at(matrix, row - 1, col + 1) == "S"))
  end

  defp check(matrix, row, _col, _letter, acc) when row > length(matrix) - 2, do: acc

  defp check(matrix, row, col, "A", acc) do
    new_acc =
      [
        acc,
        check(matrix, row, col)
      ]
      |> Enum.map(&bti/1)
      |> Enum.sum()

    case col + 1 > length(Enum.at(matrix, 0)) do
      false ->
        check(matrix, row, col + 1, at(matrix, row, col + 1), new_acc)

      true ->
        check(matrix, row + 1, 0, at(matrix, row, col + 1), new_acc)
    end
  end

  defp check(matrix, row, col, _letter, acc) do
    case col > length(Enum.at(matrix, 0)) do
      false ->
        check(matrix, row, col + 1, at(matrix, row, col + 1), acc)

      true ->
        check(matrix, row + 1, 1, at(matrix, row + 1, 1), acc)
    end
  end

  defp start_check(matrix, row, col, acc) do
    check(matrix, row, col, at(matrix, row, col), acc)
  end

  def run(input) do
    input
    |> Enum.map(&String.split(&1, "", trim: true))
    |> start_check(1, 1, 0)
  end
end
