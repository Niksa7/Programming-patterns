def min_arr(array)
  min = array[0].to_i
  for i in array
    min = i if i < min
  end
  min
end

array = [4, 2, 6, 8]
puts "Массив #{array}"
puts "Минимальный элемент: #{min_arr(array)}"
