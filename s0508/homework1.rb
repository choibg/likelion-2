def prime input
  return true if input == 2 
  if input <2
    return false 
  else 
    2.upto(input-1) do |x|
      return false if(input % x == 0)
      end
    end
    return true 
end

while true 
  print "enter a positive number:"
  input = gets.chomp.to_i
  if(prime input)
    puts "Prime"
  else
    puts "not Prime"
  end
end

