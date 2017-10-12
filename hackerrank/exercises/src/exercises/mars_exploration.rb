def dist(str1, str2)
  (0..str1.length-1).to_a.inject(0) do |result, pos|
    result +=1 if str1[pos] != str2[pos]
    result
  end
end

input = gets.chomp
# input = 'SOSSPSSQSSOR'

tuples = input.each_char.each_slice(3).map(&:join)
fn = method(:dist).curry.('SOS')
result = tuples.map(&fn)

puts result.reduce(&:+)
