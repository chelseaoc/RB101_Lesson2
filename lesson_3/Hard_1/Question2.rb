greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

#the << will mutate the original object. informal_greeting was set to greeting[:a] and greeting was passed by reference therefor was mutable when a mutating method was called on it (<<)
