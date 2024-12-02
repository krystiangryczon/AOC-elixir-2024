defmodule Advent.Code2_1 do
  def check([], _prev, _order), do: true

  def check(list, prev, order) do
    [f | rest] = list

    case order do
      :asc ->
        if(abs(prev - f) > 3 || prev >= f) do
          false
        else
          check(rest, f, order)
        end

      :desc ->
        if(abs(prev - f) > 3 || prev <= f) do
          false
        else
          check(rest, f, order)
        end
    end
  end

  defp check(list) do
    [h | rest] = list

    order =
      case h > Enum.at(rest, 0) do
        true -> :desc
        false -> :asc
      end

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
