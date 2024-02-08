def find_target(payload, target)
  complements = {}
  result = []

  payload.each do |n|
    complements[n] = target - n
  end

  payload.each do |n|
    if complements[complements[n]]
      result << n
      result << complements[n]
      break
    end
  end

  result
end

payload1 = [1, 3, 4, 5, 10]
payload2 = [-1, -3, 4, 7, -5, 18, 10, -23, 5]
payload3 = [-3, -34, 2, 6, 40, -4]

p find_target(payload1, 15)
p find_target(payload2, 15)
p find_target(payload3, 1)
