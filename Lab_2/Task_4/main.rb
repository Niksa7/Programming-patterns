require_relative 'Students_list_JSON'
require_relative 'Students_list_YAML'
require_relative 'student_list_super'

# Создаем объект класса StudentsListJSON, указывая путь к файлу
file_path = File.expand_path('students_set.json')
puts(file_path)
students_list = StudentListJSON.new()

# Чтение данных из JSON-файла
students = students_list.read_all
puts "Данные из JSON-файла:"
students.each do |student|
  puts "ID: #{student.id}, Имя: #{student.name}, гит: #{student.git}"
end

# Модификация данных
students.each do |student|
  student.age += 1 # Увеличиваем возраст на 1
end

# Запись измененных данных в JSON-файл
students_list.write_all

puts "Данные успешно записаны в JSON-файл."