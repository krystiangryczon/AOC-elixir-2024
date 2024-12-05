defmodule Advent.Code5_1 do
  def is_in?(list, num, :left, rules) do
    list
    |> Enum.map(fn {el, _} ->
      rules |> Enum.find(fn entry -> entry == {num, el} end)
    end)
    |> Enum.filter(& &1)
  end

  def is_in?(list, num, :right, rules) do
    list
    |> Enum.map(fn {el, _} ->
      rules |> Enum.find(fn entry -> entry == {el, num} end)
    end)
    |> Enum.filter(& &1)
  end

  def check(list, rules) do
    list
    |> Enum.map(fn {_, idx_main} ->
      {left, right} = Enum.split_while(list, fn {_, idx} -> idx != idx_main end)
      {num, _} = Enum.at(list, idx_main)
      is_in?(left, num, :left, rules)
      is_in?(Enum.slice(right, 1..length(right)), num, :right, rules)
    end)
    |> Enum.flat_map(& &1)
    |> then(&if &1 == [], do: list, else: nil)
  end

  def parse_input(input) do
    rules =
      input
      |> Enum.filter(&(String.length(&1) == 5))
      |> Enum.map(&String.split(&1, "|"))
      |> Enum.map(fn [a, b] -> {a, b} end)

    records =
      input
      |> Enum.filter(&(String.length(&1) > 5))
      |> Enum.map(&String.split(&1, ",", trim: true))

    {rules, records}
  end

  def run(input) do
    {rules, records} = parse_input(input)

    records
    |> Enum.map(&Enum.with_index/1)
    |> Enum.map(&Task.async(fn -> check(&1, rules) end))
    |> Enum.map(&Task.await/1)
    |> Enum.filter(& &1)
    |> Enum.map(fn list -> Enum.at(list, Integer.floor_div(length(list), 2)) end)
    |> Enum.map(fn {el, _} -> String.to_integer(el) end)
    |> Enum.sum()
  end
end
