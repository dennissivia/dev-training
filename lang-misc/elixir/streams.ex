defmodule Training do
  @moduledoc """
    Training module for some enum, stream and String exercises
  """

  @doc """
    calculate the length of all lines of a given file
  """
  def line_length(path) do
    File.stream!(path) |>
    Enum.map(&String.length(&1))
  end

  @doc """
    counts words per line
  """
  def words_per_line(path) do
    File.stream!(path) |>
    Enum.map(fn(line) -> length(String.split(line)) end)
  end

  @doc """
    retrives the longest line in a given file
  """
  def longest_line(path) do
    [{_, result}] = calculate_longest_line(path)
    result
  end

  defp calculate_longest_line(path) do
    File.stream!(path) |>
    Enum.map(fn(line) -> {String.length(line), line } end) |>
    Enum.sort(fn({len1,_},{len2,_}) -> len1 > len2 end ) |>
    Enum.take(1)
  end

  @doc """
    calculates the length of the longest line
  """
  def longest_line_length(path) do
    longest_line(path) |>
    String.length
  end

end

result = Training.longest_line(__ENV__.file)
IO.inspect result
