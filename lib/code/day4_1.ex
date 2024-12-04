defmodule Advent.Code4_1 do
  import My.Utils, only: [bti: 1]

  defp at(matrix, row, col) do
    row = Enum.at(matrix, row)

    cond do
      col < 0 -> nil
      is_nil(row) -> nil
      true -> Enum.at(row, col)
    end
  end

  defp check(matrix, row, col, ending, :down) do
    at(matrix, row + 1, col) == Enum.at(ending, 0) &&
      at(matrix, row + 2, col) == Enum.at(ending, 1) &&
      at(matrix, row + 3, col) == Enum.at(ending, 2)
  end

  defp check(matrix, row, col, ending, :right) do
    at(matrix, row, col + 1) == Enum.at(ending, 0) &&
      at(matrix, row, col + 2) == Enum.at(ending, 1) &&
      at(matrix, row, col + 3) == Enum.at(ending, 2)
  end

  defp check(matrix, row, col, ending, :cross_right) do
    at(matrix, row + 1, col + 1) == Enum.at(ending, 0) &&
      at(matrix, row + 2, col + 2) == Enum.at(ending, 1) &&
      at(matrix, row + 3, col + 3) == Enum.at(ending, 2)
  end

  defp check(matrix, row, col, ending, :cross_left) do
    at(matrix, row + 1, col - 1) == Enum.at(ending, 0) &&
      at(matrix, row + 2, col - 2) == Enum.at(ending, 1) &&
      at(matrix, row + 3, col - 3) == Enum.at(ending, 2)
  end

  defp check(matrix, row, _col, _letter, acc) when row > length(matrix) - 1, do: acc

  defp check(matrix, row, col, letter, acc) when letter in ["S", "X"] do
    ending =
      case letter do
        "X" -> "MAS"
        "S" -> "AMX"
      end
      |> String.split("", trim: true)

    new_acc =
      [
        acc,
        check(matrix, row, col, ending, :right),
        check(matrix, row, col, ending, :down),
        check(matrix, row, col, ending, :cross_right),
        check(matrix, row, col, ending, :cross_left)
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
    case col + 1 > length(Enum.at(matrix, 0)) do
      false ->
        check(matrix, row, col + 1, at(matrix, row, col + 1), acc)

      true ->
        check(matrix, row + 1, 0, at(matrix, row + 1, 0), acc)
    end
  end

  defp start_check(matrix, row, col, acc) do
    check(matrix, row, col, at(matrix, row, col), acc)
  end

  def run(input) do
    input
    |> Enum.map(&String.split(&1, "", trim: true))
    |> start_check(0, 0, 0)
  end
end
