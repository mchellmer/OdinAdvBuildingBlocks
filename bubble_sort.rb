def bubble_sort(array)
  i = 0
  while i < array.length - 1
    if array[i] > array[i+1]
      take = array[i]
      array[i] = array[i+1]
      array[i+1] = take
      i = 0
    else
      i += 1
    end
  end
  
  return array
end