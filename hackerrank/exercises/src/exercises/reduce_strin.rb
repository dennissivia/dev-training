
s = gets.strip
while s.match(/(\w)(\1)/)
  s.gsub!($~.to_s, '')
end
puts s.empty? ? 'Empty String' : s
