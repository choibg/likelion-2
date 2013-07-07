#encoding=utf-8
require 'rubygems'
require 'open-uri'
require 'hpricot'

100.downto(0) do |x| 
  doc=open("#{x}.html"){|f|Hpricot(f)}
  phone=doc.search("[@class='board_write']//td")[6].search("p").inner_html
  puts "#{x},#{phone}" if phone.size>5
end 

