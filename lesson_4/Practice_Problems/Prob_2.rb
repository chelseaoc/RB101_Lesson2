ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
age=0
ages.map{|name,num| age+=num}
puts age


puts ages.values.inject(:+)

#values turns the hash into an array of values and inject applies the operator into the array
