flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones.map! {|name| name[0..2]}


#could also use [0,3] instead of [0..2]
