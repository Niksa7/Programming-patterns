def sum_div_3(n)
  sum = 0
  n.digits.each do |digit|
    if digit % 3 == 0
      sum += digit
    end
  end
  return sum
end

puts"Введите число: "
input = gets.chomp().to_i
# puts "#{input}"
puts "Сумма цифр числа #{input}, делящихся на 3:\n#{sum_div_3(input)}"