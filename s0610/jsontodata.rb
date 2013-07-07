require 'json'
  data = %q[{"myname":"Duhee Lee","weight":"63kg"}]
  parsed = Json.parse(data)
  puts parsed["weight"]
  puts parsed["myname"]
