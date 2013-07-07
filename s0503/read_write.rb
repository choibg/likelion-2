file_write=File.open("some_file.txt","w")
file_write.puts("your text") 
file_write.close
####
file_read=File.open("some_file.txt", "r")
a=file_read.gets
file_read.close
puts a 
