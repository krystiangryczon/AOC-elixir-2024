defmodule My.Utils do
  def read_txt_file(path) do
    {:ok, content} = File.read(path)
    content |> String.split("\r\n", trim: true)
  end

  def split_file(file, on \\ "\n") do
    file |> String.split(on, trim: true)
  end

  def split(str, on \\ " ") do
    str |> String.split(on, trim: true)
  end

  def string_to_num_or_false(x) do
    case Integer.parse(x, 10) do
      {num, _} -> num
      :error -> false
    end
  end

  @spec get_test_input(default :: String.t(), day :: integer) :: String.t()
  def get_test_input(default, day) do
    v = System.get_env("TEST_INPUT") || "SMALL"

    case v do
      "SMALL" ->
        default

      _ ->
        AdventOfCode.Input.get!(day)
    end
  end

  def bti(true), do: 1
  def bti(false), do: 0
  def bti(nil), do: 0
  def bti(1), do: 1
  def bti(0), do: 0
  def bti(num) when is_integer(num), do: num

  def at(matrix, row, col) do
    row = Enum.at(matrix, row)

    cond do
      col < 0 -> nil
      row < 0 -> nil
      is_nil(row) -> nil
      true -> Enum.at(row, col)
    end
  end
end
