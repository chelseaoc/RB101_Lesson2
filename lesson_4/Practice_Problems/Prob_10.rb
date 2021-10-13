munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_value do |hash|
    if hash["age"].between?(0,17)
        hash["age_group"]="kid"
    elsif hash["age"].between?(18,64)
        hash["age_group"]="adult"
    else hash["age_group"]="senior"
    end
end

print munsters
