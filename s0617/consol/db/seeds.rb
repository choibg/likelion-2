# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
0.upto(1000) do 
  Post.create(username:('a'..'z').to_a.sample(6).join, content:('a'..'z').to_a.sample(6).join) 
end 
