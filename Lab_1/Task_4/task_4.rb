# Дан целочисленный массив. Необходмио найти индекс минимального элемента.
def ind_min(array)
  array.find_index(array.min)
end

method = ARGV[0]
path = ARGV[1]

file = File.open(path)
array = file.readline.split(' ').map(&:to_i)
puts "Массив #{array}"

case method
when "2"
  puts "Индекс минимального элемента: #{ind_min(array)}"
when "14"
  puts "Первый положительный: #{first_position(array)}"
else
  puts "Нет такого метода"
end