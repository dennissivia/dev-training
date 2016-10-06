defmodule MaxPairs do
  def main(args) when args == [] do
    usage
  end

  def main(args) do
    find_max_pair2(args) |>
    Enum.join(" ") |>
    IO.puts
  end


  def find_max_pair1(args) do
    args |>
    Enum.sort(&(&1 > &2)) |>
    Enum.take(2)
  end

  def find_max_pair2(args) do
    a = Enum.max(args)
    b = List.delete(args, a) |>
    Enum.max
    [a,b]
  end


  defp usage do
    IO.puts "Please supply a list of numbers to choose from"
  end
end
