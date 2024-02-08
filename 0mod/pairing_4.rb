animals = ["turtle", "shark", "turkey", "mole"]

p animals.filter do |animal|
  animal.start_with?("t")
end
