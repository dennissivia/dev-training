nums = Enum.to_list(-10..10)
Enum.filter(nums, &(&1 < 0 )) |> Enum.map(&(Kernel.abs(&1))) |> Enum.reverse
Enum.filter(nums, &(&1 < 0 )) |> Enum.map(&(Kernel.abs(&1))) |> Enum.reverse |> Enum.reduce(0,fn(n,akku) -> n+akku end )
Enum.filter(nums, &(&1 < 0 )) |> Enum.map(&(Kernel.abs(&1))) |> Enum.reverse |> Enum.reduce(0,&+/2)
