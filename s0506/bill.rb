bill=File.open("bill.txt","r")
  temp=Array.new
  result=Hash.new

  bill.gets.split("").map{|s| temp<<s} 
  temp.each do |x| 
    if(result.has_key? (x))
      result[x]=result[x]+1
    else
      result[x]=1
    end
  end
    print result.sort_by {|k,v| v }.reverse
    bill.close
