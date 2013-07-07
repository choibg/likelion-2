sangwha=Array.new
while sangwha.size < 10000
  sangwha <<(1..45).to_a.sample(6).sort
end
  sangwha.uniq!
sangwha.each do |x|
  if (([1,2,3,4,5,6]&x).size>=5)
    puts "Congraturations!!"
  end
end 
