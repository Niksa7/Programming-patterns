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

def mutually_simple(bef, af=bef, num=1)
  if af == 1
    num
  else
    mutually_simple(bef, af-1, num + (simple(bef, af) ? 1:0))
  end
end

puts"Введите число: "
input = gets.chomp().to_i
# puts "#{input}"
puts "Количество взаимно простых с заданным:\n#{mutually_simple(input)}"