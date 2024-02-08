def capitalize_every_other_word(sentence)
  sentence.split(' ').map.with_index do |word, i|
    i.even? ? word.capitalize : word
  end.join(' ')
end

p capitalize_every_other_word('The quick brown fox jumps over the lazy dog.')
