def aaa(input_word) 
  a=Array.new 
  a=input_word.split(//) 
  b=a.reverse 

  if (a==b)
    return true 
  else 
    return false 
  end 

end 

while true 
  print "Input word or sentence:"
  input_word=gets.chomp
  puts aaa(input_word)
end 
