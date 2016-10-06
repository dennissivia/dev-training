
s = gets.chomp

puts s.inspect
s.each_char.inject([s[0],[]]).with_index do |((carry, akku), char), i|
  puts carry
  puts char
  puts i
  if ! carry == char
    result << char
    carry = char
  end
  [carry, result]
end
