def reverse_string(string)
  [*(0...string.length)].map{ |i| string[-1 - i] }.join
end

def reverse_string2(string)
  string.chars.reduce(''){ |acc, char| char + acc }
end

p reverse_string("Reverse this string!")

p reverse_string2("Reverse this string!")
