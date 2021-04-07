# Given an array


def bubble_sort!(array)
  repeat_sort = true
  
  while repeat_sort == true
    repeat_sort = false
    idx = 0
    
    while idx < (array.length - 1)
      # puts idx
      n_1 = array[idx]
      n_2 = array[idx + 1]
      
      if n_1 > n_2
        array[idx] = n_2
        array[idx + 1] = n_1
        repeat_sort = true
      end
      
      idx += 1
    end
  end
  array
end


array = [5, 3]
bubble_sort!(array)
puts array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
puts array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
puts array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)