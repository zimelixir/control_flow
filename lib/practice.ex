defmodule Practice do
  @doc "A function that calculates the length of a list"
  def list_len(list), do: len(0, list)

  defp len(acc, []), do: acc

  defp len(acc, [_ | tail]), do: len(acc + 1, tail)

  @doc "
  A function that takes two integers and returns a list of all integer
  numbers in the given range
  "
  def range(from, to), do: build_list([], from, to)

  defp build_list(_, from, to) when from > to, do: []

  defp build_list(acc, num, num), do: Enum.sort([num | acc])

  defp build_list(acc, from, to), do: build_list([from | acc], from + 1, to)

  @doc "
  A function that takes a list and returns another list that contains only
  positive numbers from the input list
  "
  def positive(list), do: gen_positive_list([], list)

  defp gen_positive_list(acc, []), do: Enum.reverse(acc)

  defp gen_positive_list(acc, [head | tail]) do
    if head >= 0 do
      gen_positive_list([head | acc], tail)
    else
      gen_positive_list(acc, tail)
    end
  end
end
