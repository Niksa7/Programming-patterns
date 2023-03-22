def min_arr(array)
  min = array[0].to_i
  for i in array
    min = i if i < min
  end
  min
end

def first_position(array)
  ind = 0
  i = 0
  while i < array.length
    if array[i] > 0
      ind = i
      return ind
    end
    i += 1
  end
  ind
end

method = ARGV[0]
path = ARGV[1]

file = File.open(path)
array = file.readline.split(' ').map(&:to_i)
puts "Массив #{array}"
case method
when "min"
  puts "Минимальный элемент: #{min_arr(array)}"
when "first+"
  puts "Первый положительный: #{first_position(array)}"
else
  puts "Нет такого"
end