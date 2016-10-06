
defmodule Training do
  def range(a,b) do
    build_range([],a,b)
  end

  def build_range(list,a,b) when a > b do
    list
  end

  def build_range(list,a,b) do
    build_range(list ++ [a], a + 1, b)
  end

  # def list_len([]), do 0
  def list_len_tco(list) do
    do_list_len(0,list)
  end

  defp do_list_len(accu,[]) do
    accu
  end
  defp do_list_len(accu,[_ | tail]) do
    do_list_len(accu+1, tail)
  end
end
