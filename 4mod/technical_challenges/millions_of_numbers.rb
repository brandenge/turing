nums_1 = [1, 2, 4, 5, 8]
nums_2 = [2, 3, 5, 7, 9]
nums_3 = [1, 2, 5, 8, 9]

def find_matches(nums_1, nums_2, nums_3)
  i1 = 0
  i2 = 0
  i3 = 0
  result = []

  while i1 < nums_1.length
    max = [nums_1[i1], nums_2[i2], nums_3[i3]].max
    if nums_1[i1] == max && nums_2[i2] == max && nums_3[i3] == max
      result << max
      i1 += 1
      i2 += 1
      i3 += 1
    end
    if nums_1[i1] < max
      i1 += 1
    end
    if nums_2[i2] < max
      i2 += 1
    end
    if nums_3[i3] < max
      i3 += 1
    end
  end
  result
end

p find_matches(nums_1, nums_2, nums_3)
# => [2, 5]
