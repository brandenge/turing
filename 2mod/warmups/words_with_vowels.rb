# Find words in a word list that contain all the vowels in alphabetical order, non-repeated, where vowels are defined as A E I O U Y. Use this word list.

words = File.readlines("word-list.txt").map(&:chomp)
vowels = %w(a e i o u y)

final_word_list = words.filter do |word|
  word.chars & vowels == vowels &&
  word.chars.filter{ |char| vowels.include?(char) }.count == 6
end

p final_word_list
