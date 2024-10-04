defmodule EnumStreams do
  @doc "
    A function that takes a file path and returns a list of numbers,
    with each number representing the length of the corresponding line
    from the file.
  "
  def lines_length!(file_path) do
    File.stream!(file_path)
    |> Stream.map(&length(String.split(&1)))
    |> Stream.with_index()
    |> Enum.each(fn {count, index} -> IO.puts("#{index + 1}. #{count}") end)
  end

  @doc "
    A function that returns the length of the longest line in a file.
  "
  def longest_line_length!(file_path) do
    File.stream!(file_path)
    |> Stream.map(&length(String.split(&1)))
    |> Enum.max()
  end

  @doc "
    A function that returns the contents of the longest line in a file.
  "
  def longest_line!(file_path) do
    File.stream!(file_path)
    |> Stream.map(&{&1, length(String.split(&1))})
    |> Enum.max_by(fn {_, len} -> len end)
  end

  @doc "
    A function that returns a list of numbers, with each number representating
    the word count in a file.
  "
  def words_per_line!(file_path) do
    File.stream!(file_path)
    |> Stream.map(&length(String.split(&1)))
    |> Enum.to_list()
  end
end
