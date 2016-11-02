
t = gets.strip.to_i
t.times do
  _n = gets
  fields = gets.strip
  grouped = fields.each_char.group_by(&:itself)
  puts "grouped: #{grouped}"
  empties = grouped['_'].length
  odds    = grouped.select{|k,v| k =~ /[A-Z]/ && v.length.odd?}.length
  puts "empties: #{empties.inspect}"
  puts "odds: #{odds.inspect}"
end
