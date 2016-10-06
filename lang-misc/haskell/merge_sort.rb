def mergeSort array
  return array if array.empty?
  return array if array.length == 1
  half = array.size / 2
  left = array[0,half]
  right = array[half,half+1]
  merge(mergeSort(left), mergeSort(right))
end

def merge left, right
  return rigth if left.empty?
  return left if right.empty?
  l,*ls = left
  r,*rs = right
  if l <= r
    [l] + merge(ls, right)
  else
    [r] + merge(left, rs)
  end
end

n = gets.chomp
nums = gets.chomp.split.map(&:to_i)
puts mergeSort(nums).join(" ")
