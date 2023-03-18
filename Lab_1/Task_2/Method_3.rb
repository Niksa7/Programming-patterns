#Метод 3 Найти делитель числа, являющийся взаимно простым с
#наибольшим количеством цифр данного числа.

def nod(a, b)
  if b ==0
    a
  else
    nod(b, a % b)
  end
end

def simple(a, b)
  nod(a, b) == 1
end

def method_3(number)
  count = 0
  array = Array.new
  arr = Array.new
  div = 2.upto(number-1) do |numbers|
    if number % numbers == 0
      arr.append(numbers)
    end
  end
  for i in arr do
    number.digits.each do |digit|
      if simple(i, digit)
        count += 1
      end
    end
    array << count
  end
  return array.max
end

puts"Введите число: "
input = gets.chomp().to_i
# puts "#{input}"
puts "Решение:\n#{method_3(input)}"