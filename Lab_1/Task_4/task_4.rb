# Дан целочисленный массив. Необходмио найти индекс минимального элемента.
def ind_min(array)
  array.find_index(array.min)
end

# Дан целочисленный массив и интервал a..b. Найти кол-во элементов в интервале.
def inter_between_max(array, interval)
  array.count {|el| el >= interval[0] && el <= interval[1]}
end

puts "Введите массив: "
array = gets.chomp.split(' ').map(&:to_i)
puts "Массив #{array}"

puts "Выберете метод:
2: Найти индекс минимального элемента;
14: Найти кол-во элементов в интервале;
26: ;
38: ;
50: .
"
method = gets.chomp.to_i

case method
when 2
  puts "Индекс минимального элемента: #{ind_min(array)}"
when 14
  puts "Введите интервал: "
  interval = gets.chomp.split(' ').map(&:to_i)
  # puts "#{interval}"
  puts "Найти кол-во элементов в интервале: #{inter_between_max(array, interval)}"
else
  puts "Нет такого метода"
end