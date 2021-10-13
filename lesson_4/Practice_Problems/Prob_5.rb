flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index{|name,index| puts index if name.start_with?("Be")}


#A way to have it return the index is just using the .index method

flintstones.index{|name| name[0,2]=="Be"}
