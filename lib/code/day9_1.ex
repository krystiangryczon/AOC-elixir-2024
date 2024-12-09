defmodule Advent.Code9_1 do
  def get_last([]), do: {"0", []}

  def get_last(list) do
    {{el, _}, rest} = List.pop_at(list, -1)

    case el do
      "." -> get_last(rest)
      _ -> {el, rest}
    end
  end

  def move_and_sum([], sum), do: sum

  def move_and_sum(list, acc) do
    [{element, idx} | rest] = list

    case element do
      "." ->
        {e, r} = get_last(rest)
        move_and_sum(r, acc + String.to_integer(e) * idx)

      _ ->
        move_and_sum(rest, acc + String.to_integer(element) * idx)
    end
  end

  def build(list, acc \\ [])
  def build([], acc), do: acc

  def build(list, acc) do
    [{h, idx} | tail] = list

    case rem(idx, 2) == 0 do
      true -> build(tail, acc ++ List.duplicate("#{Integer.floor_div(idx, 2)}", h))
      false -> build(tail, acc ++ List.duplicate(".", h))
    end
  end

  def run(input) do
    input
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.with_index()
    |> build()
    |> Enum.with_index()
    |> move_and_sum(0)
  end
end
