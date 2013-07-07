def string_match(names, char)
  doing=false
  names.each do |name|
    if name[0] ==char
      puts name 
      doing =true
    end
  end
  puts "no matches" if !doing 
end 

string_match(["ant", "elephant","aardvark", "dog", "antelope"],"a")
puts "+++++" 
string_match(["ant", "elephant", "aardvark", "dog", "antelope"],"t")

  
