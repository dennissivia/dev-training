defmodule Randoms do
  def main(args) do
    n = args |>
    maybe_args |>
    List.first |>
    String.to_integer

    Enum.take_random(1..1_000_000, n) |>
    Enum.join(" ") |>
    IO.puts
  end

  def maybe_args(args) when args == [] do
    ["5"]
  end

  def maybe_args(args) do
    args
  end
end
