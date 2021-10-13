ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

puts ages.select{|name,age| age<100}

#You can also use the destructive .keep_if method
