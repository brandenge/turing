array = [2, 5, 33, 62, 99, 82, 45, 7]
array.each do |num|
  p num if num > 30
end

p "--------"

array.each do |num|
  p num if num < 60
end
