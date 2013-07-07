def sum_digits string 
  sum = 0
    string.each_char do |x|
      sum += x.to_i
    end 
  return sum
end

while true
  print "enter a positive integer:"
  input =gets.chomp
  puts sum_digits input
end 
  
