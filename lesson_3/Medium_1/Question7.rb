munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

#This will mutate the original munsters hash.  The hash object is passed by reference into the mess_with_demographics method.  The _[]= method is mutable and will mutate the original hash.  The object_id of the munsters hash will be unchange before and after the method, but the values of munsters will be mutated.
