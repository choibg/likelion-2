require 'json'
  data = Hash.new
  data["myname"] = "Duhee Lee"
  data["weight"] = "63kg"
  json = data.to_json
  parsed=Json.parse(json)
  puts parsed["weight"]
  puts parsed["myname"]

