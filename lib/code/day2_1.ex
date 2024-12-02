defmodule Advent.Code2_1 do
  def check([], _prev, _order), do: true

  def check(list, prev, order) do
    [f | rest] = list

    case order do
      :asc ->
        if abs(prev - f) > 3 || prev >= f,
          do: false,
          else: check(rest, f, order)

      :desc ->
        if abs(prev - f) > 3 || prev <= f,
          do: false,
          else: check(rest, f, order)
    end
  end

  defp check(list) do
    [h | rest] = list

    order =
      if h > Enum.at(rest, 0), do: :desc, else: :asc

    check(rest, h, order)
  end

  def run(input) do
    input
    |> Enum.map(fn x ->
      String.split(x, " ")
      |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.filter(&check/1)
    |> length()
  end
end
