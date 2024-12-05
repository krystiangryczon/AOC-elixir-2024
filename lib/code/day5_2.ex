# ["75", "47", "61", "53", "29"],
# ["97", "61", "53", "29", "13"],
# ["75", "29", "13"],
# ["75", "97", "47", "61", "53"],
# ["61", "13", "29"],
# ["97", "13", "75", "29", "47"]

# {"47", "53"}, {"97", "13"}, {"97", "61"}, {"97", "47"},
# {"75", "29"}, {"61", "13"}, {"75", "53"}, {"29", "13"},
# {"97", "29"}, {"53", "29"}, {"61", "53"}, {"97", "53"},
# {"61", "29"}, {"47", "13"}, {"75", "47"}, {"97", "75"},
# {"47", "61"}, {"75", "61"}, {"47", "29"}, {"75", "13"}, {"53", "13"}

# original_: ["98", "63", "27", "44", "15"]
# corrected: ["63", "44", "27", "15", "98"]

# original_: ["83", "59", "37", "38", "82"]
# corrected: ["83", "38", "82", "37", "59"]

defmodule Advent.Code5_2 do
  alias Advent.Code5_1, as: Part1

  defp swap([], list), do: list

  defp swap(steps, list) do
    [{this, that} | rest] = steps

    this_idx = Enum.find_index(list, fn el -> el == this end)
    that_idx = Enum.find_index(list, fn el -> el == that end)

    new_list =
      list
      |> List.replace_at(this_idx, that)
      |> List.replace_at(that_idx, this)

    swap(rest, new_list)
  end

  defp fix(list, rules) do
    list
    |> Enum.map(fn {_, idx_main} ->
      {left, right} = Enum.split_while(list, fn {_, idx} -> idx != idx_main end)
      {num, _} = Enum.at(list, idx_main)

      Part1.is_in?(left, num, :left, rules)

      Part1.is_in?(Enum.slice(right, 1..length(right)), num, :right, rules)
      # |> IO.inspect(label: "right")
    end)
    |> Enum.flat_map(& &1)
    |> swap(list |> Enum.map(fn {el, _} -> el end))
    |> Enum.with_index()
  end

  def run(input) do
    {rules, records} = Part1.parse_input(input)

    correct_records =
      records
      |> Enum.map(&Enum.with_index/1)
      |> Enum.map(&Task.async(fn -> Part1.check(&1, rules) end))
      |> Enum.map(&Task.await/1)
      |> Enum.filter(& &1)

    # incorrect_records
    records
    |> Enum.map(&Enum.with_index/1)
    |> Enum.filter(fn record -> record not in correct_records end)
    |> Enum.map(fn list ->
      fix(list, rules)
    end)
    |> Enum.map(&fix(&1, rules))
    |> Enum.map(&fix(&1, rules))
    |> Enum.map(&fix(&1, rules))
    |> Enum.map(&fix(&1, rules))
    |> Enum.map(&fix(&1, rules))
    |> Enum.map(&fix(&1, rules))
    |> Enum.map(&fix(&1, rules))
    |> Enum.map(&fix(&1, rules))
    |> Enum.map(&fix(&1, rules))
    |> Enum.map(&fix(&1, rules))
    |> Enum.map(&fix(&1, rules))
    |> Enum.map(&fix(&1, rules))
    |> Enum.map(&fix(&1, rules))
    |> Enum.map(&fix(&1, rules))
    |> Enum.map(fn list -> Enum.at(list, Integer.floor_div(length(list), 2)) end)
    |> Enum.map(fn {el, _} -> String.to_integer(el) end)
    |> Enum.sum()

    # ^will fix some time (I've put it through fixing fun so many times it eventually settled on a result, which means it's correct)
  end
end
