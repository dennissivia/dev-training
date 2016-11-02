def sum_array(arr)
  return 0 if arr.length < 2
  
  a = Array(arr).sort
  min = a.first
  max = a.last
  a.reject{|x| x == min || x == max}.reduce(0, :+)
end

p sum_array([6, 0, 1, 10, 10])

