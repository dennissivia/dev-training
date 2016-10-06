defmodule APlusB do
  def main(_args) do
    a = read_integer('Enter a: ')
    b = read_integer('Enter b: ')

    IO.puts (a+b)
  end

  defp read_integer(message) do
    IO.gets(message) |>
    String.strip |>
    String.to_integer
  end
end
