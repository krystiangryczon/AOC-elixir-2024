defmodule Advent.Code6_1 do
  import My.Utils, only: [at: 3]

  defp turn(:up), do: :right
  defp turn(:right), do: :down
  defp turn(:down), do: :left
  defp turn(:left), do: :up

  defp walk(_map, _pos, _dir \\ :up, _acc \\ [])

  defp walk(_map, {row, col}, _direction, acc) when is_nil(row) or is_nil(col),
    do: acc

  defp walk(map, {row, col}, :left, acc) do
    case at(map, row, col - 1) do
      "#" -> walk(map, {row, col}, turn(:left), acc)
      "." -> walk(map, {row, col - 1}, :left, [{row, col} | acc])
      "^" -> walk(map, {row, col - 1}, :left, [{row, col} | acc])
      nil -> [{row, col} | acc]
    end
  end

  defp walk(map, {row, col}, :right, acc) do
    case at(map, row, col + 1) do
      "#" -> walk(map, {row, col}, turn(:right), acc)
      "." -> walk(map, {row, col + 1}, :right, [{row, col} | acc])
      "^" -> walk(map, {row, col + 1}, :right, [{row, col} | acc])
      nil -> [{row, col} | acc]
    end
  end

  defp walk(map, {row, col}, :up, acc) do
    case at(map, row - 1, col) do
      "#" -> walk(map, {row, col}, turn(:up), acc)
      "." -> walk(map, {row - 1, col}, :up, [{row, col} | acc])
      "^" -> walk(map, {row - 1, col}, :up, [{row, col} | acc])
      nil -> [{row, col} | acc]
    end
  end

  defp walk(map, {row, col}, :down, acc) do
    case at(map, row + 1, col) do
      "#" -> walk(map, {row, col}, turn(:down), acc)
      "." -> walk(map, {row + 1, col}, :down, [{row, col} | acc])
      "^" -> walk(map, {row + 1, col}, :down, [{row, col} | acc])
      nil -> [{row, col} | acc]
    end
  end

  defp find_start(map, mark \\ "^") do
    search =
      map
      |> Enum.map(&Enum.find_index(&1, fn x -> x == mark end))

    # {row, col}
    {Enum.find_index(search, &(&1 != nil)), Enum.find(search, &(&1 != nil))}
  end

  def run(input) do
    map =
      input
      |> Enum.map(&String.split(&1, "", trim: true))

    walk(map, find_start(map))
    |> Enum.uniq()
    |> length()
  end
end
