puts "Как вас зовут?"
user = STDIN.gets.chomp #STDIN для того чтобы при вызове файла в консоли мы не обращали внимание на переданный аргумент
puts "Привет, #{user}!"
puts "Какой язык программирования тебе нравится больше всего?"

user_language = STDIN.gets.chomp
case user_language
when "ruby"
    puts "Ты грязный подлиза!"
  when "C++"
    puts "Это база."
  when "F#"
    puts "Ты легенда!"
  when "Python"
    puts "Good"
  else
    puts "Грядет рубипокалипсис!"
end