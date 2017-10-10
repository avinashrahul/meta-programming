
# insert 10 at position 2
# Using Array insert

def insert(ele, pos)
  arr = [1, 2, 3, 4, 5]
  arr.insert(pos, ele)
  return arr
end

print insert(10, 2)

# Using Linked List

def insert(ele, pos)
  arr = [1, 2, 3, 4, 5]
  tmp = arr[pos]
  arr[pos] = ele
  arr.replace(arr[0..pos] + [tmp] + arr[pos+1..-1])
  return arr
end

print insert(10, 2)