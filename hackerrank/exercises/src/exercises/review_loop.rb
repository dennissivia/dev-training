
def process
  s = gets.strip
  odds, evens = s.each_char.with_index.partition { |_c, i| i.even? }

  str1 = odds.flat_map(&:first).join('')
  str2 = evens.flat_map(&:first).join('')

  puts "#{str1} #{str2}"
end

q = gets.strip.to_i
q.times do
  process
end
