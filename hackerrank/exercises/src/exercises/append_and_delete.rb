
s = gets.strip
t = gets.strip
k = gets.strip.to_i

first_diff = s.length

0.upto(s.length) do |i| 
  if s[i] != t[i]
    first_diff = i
    break
  end
end

deletes = s.length - first_diff
puts "#{deletes} deletes"

moves = deletes + (t.length - first_diff)
puts "#{moves} total changes"


# special case if we have more moves than deleting all of S
# it will always work since we can simply delete until rest of k
# is exactly length l t


if ((k - moves) >= 0 && (k - moves).even?) || (s == t) || k > t.length
  puts "Yes"
else
  puts "No"
end
