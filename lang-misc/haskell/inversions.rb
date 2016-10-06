def countInversions array
  return 0 if array.length < 2
  half = (array.size+1) / 2
  left = array[0,half]
  right = array[half,half]
  return countInversions(left) + countInversions(right) + merge(array, left, right)
end

# convert me to count inversions
def merge arr, left, right
  i = j = count = 0
  while (i < left.length || j < right.length) do
    if (i == left.length)
      arr[i+j] = right[j]
      j+=1
    elsif j == right.length
      arr[i+j] = left[i]
      i+=1
    elsif (left[i] <= right[j])
      arr[i+j] = left[i]
      i+=1
    else
      arr[i+j] = right[j]
      count += left.length-i
      j+=1
    end
  end
  count;
end

n = gets.chomp
nums = gets.chomp.split.map(&:to_i)
puts countInversions(nums).to_s
