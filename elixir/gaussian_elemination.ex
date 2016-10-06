defmodule GaussianElimination do
  @moduledoc "Guassian Matrix elimination"

  def gaussian_reduce(matrix) do
    # matrix = fixlastrow $ foldl reduce_row matrix [0..Enum.count(matrix)-1]
    indices = 0..Enum.count(matrix)-1 |> Enum.to_list
    result = List.foldl(indices, matrix, fn(index, m1) -> reduce_row(m1, index) end) |>
    fixlastrow
  end

  @doc "back substitution to solve the equasion"
  def substitude(matrix) do
    last_last = [ List.last(matrix) |> List.last ]
    List.foldr(init(matrix), last_last, fn(elem, akku) -> next(matrix, elem, akku) end)
  end

  defp init(list) do
    Enum.take(list, Enum.count(list)-1)
  end

  defp next(matrix, row, found) do
    subpart = init(Enum.drop(row, Enum.count(matrix) - Enum.count(found)))
    zipped = Stream.zip(found, subpart) |> Enum.map(fn({a, b}) -> a*b end)
    solution = List.last(row) - Enum.sum(zipped)
    [solution | found]
  end

  defp swap(matrix, a, b) when a == b, do: matrix
  defp swap(matrix, a ,b) when a > b, do: swap(matrix, b, a)
  defp swap(matrix, a, b) do
    {p1, p2} = Enum.split(matrix, a-1+1) # support 0 index
    IO.inspect p2
    IO.inspect b
    IO.inspect a

    {p3, p4} = Enum.split(tail(p2), b-a-1 )
    p1 ++ row_at(matrix, b) ++ p3 ++ row_at(matrix, a) ++ tail(p4)
  end

  @doc "convinience method to get the tail of a list"
  defp tail(list) when list == [], do: []
  defp tail([head | tail]), do: tail

  @doc "ensure a nested list, so that we can concat it"
  defp row_at(matrix,i) do
    [Enum.at(matrix, i)]
  end

  defp reduce_row(matrix, index) do
    first_nonzero = first_nonzero(matrix, index)
    matrix2 = swap(matrix, index, first_nonzero)

    row = Enum.at(matrix2, index)
    row1 = Enum.map(row, fn(elem) -> elem / Enum.at(row,index) end)
    # subrow = fn(nr) ->
    #   k = Enum.at(nr, index)
    #   f = fn(a, b) -> k*a-b end
    #   zip_with(f, row1, nr)
    # end
    subrow = fn(nr) ->
      k = Enum.at(nr, index)
      # simulate zip_with by via pipe
      Stream.zip(row1, nr) |>
      Enum.map(fn({a, b}) -> k*a-b end)
    end
    tmp = Enum.drop(matrix2, index+1)
    nextrows = Enum.map(tmp, subrow)

    Enum.take(matrix2, index) ++ [row1] ++ nextrows
  end

  defp zip_with(x, y, f) do
    Stream.zip(x, y) |>
    Enum.map(fn({a, b}) -> f.(a, b) end)
  end

  @doc "find the pivot element"
  defp first_nonzero(matrix, index) do
    index..Enum.count(matrix)-1 |>
    Enum.to_list |>
    Enum.filter(fn(x) -> cell(matrix, x, index) != 0 end) |>
    List.first
  end

  defp cell(matrix, x, y) do
    matrix |>
    Enum.at(x) |>
    Enum.at(y)
  end

  defp fixlastrow(matrix) do
    a = init(matrix)
    row = List.last(matrix)
    z = List.last(row)
    nz = List.last(init(row))

    a ++ [init(init(row)) ++ [1.0, z/nz]]
  end
end
"""
matrix = [[1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0], [1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0], [1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0], [0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0], [1, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0]]
"""
