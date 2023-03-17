puts "Как вас зовут?"
user = STDIN.gets.chomp

puts "Привет, #{user}! Введите команду вашей ОС."
cmd_os = STDIN.gets.chomp
system cmd_os

puts "Введите команду для Ruby."
command_ruby = STDIN.gets.chomp
system "ruby -e \"#{command_ruby}\""