#encoding=utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
a=["이두희","최용철","하재승","조승현","유하은","최보금","지서인","박수상","권보경",
  "배인호","오천석","최우정","김길호","김다민","조건형","윤승규","김성수","이주민","임선영",
  "박연주","양영석","최용호","전민영","김예흰","이홍석","신범준","권성연","변지훈","김건",
  "김민정","김상화","정호석","함영규","추준호","김도진","오주현"]
0.upto(1000) do 
  Post.create(username:a.sample(1).first, content:('a'..'z').to_a.sample(6).join)
end 
