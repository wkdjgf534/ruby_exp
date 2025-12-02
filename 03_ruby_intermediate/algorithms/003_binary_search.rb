# frozen_string_literal: true

def binary_search(array, key, low = 0, high = array.size - 1)
  return -1 if low > high

  mid = (low + high) / 2

  return mid if array[mid] == key

  array[mid] > key ? high = mid - 1 : low = mid + 1

  binary_search(array, key, low, high)
end

array = (1_000..10_000_000).to_a
p binary_search(array, 8743)
