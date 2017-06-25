file = File.open($0, "r")
 file.readlines.each do |line|
     puts line
 end
 
 #This can also be used to get the name of the currently executed file  puts File.basename(__FILE__)
