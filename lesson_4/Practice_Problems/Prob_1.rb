
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]


hash={}
flintstones.each_with_index {|name,index| hash[name]=index}
puts hash

