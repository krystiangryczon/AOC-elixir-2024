defmodule Advent.Code9_2 do
  def mingle({nil, nil_size}, {_, el_size}) when nil_size - el_size < 0, do: []

  def mingle({nil, nil_size}, {el_idx, el_size}) when nil_size - el_size == 0,
    do: [{el_idx, el_size}]

  def mingle({nil, nil_size}, {el_idx, el_size}) when nil_size - el_size > 0,
    do: [{el_idx, el_size}, {nil, nil_size - el_size}]

  def move(_list, _start_end_idx, termination_sigil \\ :continue)
  def move(list, _, :terminate), do: list

  def move(list, start_end_idx, termination_sigil) do
    {last_item, rest} = List.pop_at(list, start_end_idx)
    {last_element, last_size} = last_item

    if(!last_element) do
      move(list, start_end_idx - 1, termination_sigil)
    else
      nil_for_last_elem_index =
        Enum.find_index(list, fn {e, s} ->
          is_nil(e) && last_size <= s && -start_end_idx <= length(list)
        end)

      termination_sigil =
        if last_element == 0,
          do: :terminate,
          else: :continue

      cond do
        is_nil(nil_for_last_elem_index) ->
          move(list, start_end_idx - 1, termination_sigil)

        !is_nil(nil_for_last_elem_index) &&
            nil_for_last_elem_index > Enum.find_index(list, &(&1 == last_item)) ->
          move(list, start_end_idx - 1, termination_sigil)

        true ->
          new_list =
            List.replace_at(
              rest,
              nil_for_last_elem_index,
              mingle(Enum.at(list, nil_for_last_elem_index), last_item)
            )
            |> List.insert_at(start_end_idx, {nil, last_size})
            |> List.flatten()

          move(new_list, start_end_idx - 1, termination_sigil)
      end
    end
  end

  # returns [{element_index, size}]
  def build(list, acc \\ [])
  def build([], acc), do: acc

  def build(list, acc) do
    [{h, idx} | tail] = list

    case rem(idx, 2) == 0 do
      true -> build(tail, acc ++ [{Integer.floor_div(idx, 2), h}])
      false -> build(tail, acc ++ [{nil, h}])
    end
  end

  defp convert_to_flat_list(_list, _acc \\ [])
  defp convert_to_flat_list([], acc), do: acc

  defp convert_to_flat_list(list, acc) do
    [{el, size} | tail] = list
    convert_to_flat_list(tail, acc ++ List.duplicate(el || 0, size))
  end

  def run(input) do
    input
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.with_index()
    |> build()
    |> move(-1)
    |> convert_to_flat_list()
    |> Enum.with_index()
    |> Enum.map(fn {el, idx} -> el * idx end)
    |> Enum.sum()
  end
end
