# back_at_origin(string)
# hash of N, S, E, W keys, with integer values for counts
# direction set to north
# iterate through the string
# when I encounter a G, add 1 to the current direction in the hash
# when I encounter an L, change the current direction to the left (north to west, etc.)
# when I encounter an R, change the current direction to the right (north to east, etc.)

# return N == S && E == W

movements1 = 'GRGRGRG'
movements2 = 'GRRG'
movements3 = 'LRGRRG'
movements4 = 'GRGL'
movements5 = 'RLRLGGRLRLRRGG'

def back_at_origin(movements)
  counts = {
    n: 0,
    s: 0,
    e: 0,
    w: 0
  }

  direction = :n

  movements.chars.each do |char|
    if char == 'G'
      counts[direction] += 1
    end
    if char == 'L'
      case direction
      when :n then direction = :w
      when :w then direction = :s
      when :s then direction = :e
      when :e then direction = :n
      end
    end
    if char == 'R'
      case direction
      when :n then direction = :e
      when :e then direction = :s
      when :s then direction = :w
      when :w then direction = :n
      end
    end
  end

  counts[:n] == counts[:s] && counts[:e] == counts[:w]
end

p back_at_origin(movements1)
p back_at_origin(movements2)
p back_at_origin(movements3)
p back_at_origin(movements4)
p back_at_origin(movements5)
