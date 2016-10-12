
def good?(s)
   s.gsub(/[0-9]*/,'').length == 0
end
s = gets.strip
