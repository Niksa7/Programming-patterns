require_relative 'student'
require_relative 'student_short'
require_relative '../Task_3/Data_list_student_short'
require_relative '../Task_3/Data_table'
require_relative '../Task_3/Data_list'
require_relative '../Task_4/student_list_super'
require_relative '../Task_4/Students_list_JSON'
require_relative '../Task_4/Students_list_YAML'

student1 = Student.new(surname='Сорока',
                       name='Никита',
                       lastname='Алексеевич',
                       id:'1',
                       git:'https://github.com/Niksa7',
                       phone:'+99825121826',
                       telegram:'@NekiManO',
                       email:'nikitasoroka228@gmail.com'
)
student2 = Student.new('Епифанцев', 'Всеволод', 'Александрович', id:'2', git:'https://github.com/Vsevolod1817', telegram:'@SevaGrut', email:'seva.epifantsev@gmail.com')
# student1.phone= '+78925121826'
student2.phone="+79823784674"
student2.set_contacts(telegram: "@SevaKrut", phone: "+799999999990")

# Вывод полной и краткой информации об экземляре класса
# student2.to_s
# student2.get_info

#Проверка валидации
puts Student.valid_phone?('+79823784674')
puts Student.valid_telegram?('@NekiMan0')
puts Student.valid_git?('Vsevolod1817')
puts Student.valid_name?('Артем')
puts Student.valid_email?('nikitasoroka228@gmail.com')

# Student_short двумя способами через объект родительского класса(1) и через id и строки с кр. инфой(2)
student3 = Student_short.from_object(student2)
student3 = Student_short.new(2, student2.get_info)


puts "/////////////"
# Экземпляр класса Data_table
table = DataTable.new([
                         ["Имя", "Возраст", "City"],
                         ["Сева", 25, "Лондон"],
                         ["Никита", 40, "Краснодар"],
                         ["Артур", 55, "Париж"]
                       ])

# Исходная таблица
puts "Исходная таблица:"
table.each { |row| puts row.join(", ") }

# Новый массив объектов
new_data = [
  [nil, nil, nil],
  [nil, nil, "Токио"],
  ["Ева", 30, nil],
  ["Алиса", nil, "Берлин"]
]

puts "/////////////"

puts '///////////'
puts 'test 2.3'

stud_short1 = Student_short.new(1, 'Сорока Н.А., @soroka, nikitasoroka228@gmail.com')
stud_short2 = Student_short.new(2,'Епик Ф.А., @epicfancev, epicfancev@mail.org')
puts stud_short1

arr = [stud_short1, stud_short2]
data_l = DataListStudentShort.new(arr)
dataTable = data_l.get_data
print dataTable.get_elements(0,0),"\n"
print dataTable.get_elements(0,1),"\n"
print dataTable.get_elements(0,2),"\n"
print dataTable.get_elements(0,3),"\n"
print dataTable.get_elements(1,0),"\n"
print dataTable.get_elements(1,1),"\n"
print dataTable.get_elements(1,2),"\n"
print dataTable.get_elements(1,3),"\n"

test = [ [1,'One'], [2,'Two']]
test_table = DataTable.new(test)
puts test_table
puts test_table.get_elements(0,1)
puts test_table.get_elements(0,2)


# JSON

student4 = Student.new(surname='Сорока',
                       name='Никита',
                       lastname='Алексеевич',
                       id:'1',
                       git:'https://github.com/Niksa7',
                       phone:'+99825121826',
                       telegram:'@NekiManO',
                       email:'nikitasoroka228@gmail.com')
student5 = Student.new(surname='Куксенко',
                       name='Егор',
                       lastname='Сергеевич')
student6 = Student.new(surname='Иванов',
                       name='Иван',
                       lastname='Сергеевич', git: '@ivannn')
puts '/////////////////////////////////'
puts 'test JSON'

json_strategy = StudentListJSON.new
yaml_strategy = StudentListYAML.new

stud_list = StudentListBase.new(json_strategy)
stud_list.add_student(student4)
stud_list.add_student(student5)
stud_list.add_student(student6)
stud_list.save_to_file('D:/RubyMine Projects/Programming-patterns/Lab_2/Task_4/students.json')
stud_list.load_from_file('D:/RubyMine Projects/Programming-patterns/Lab_2/Task_4/students.json')
puts "Кол-во студентов json: #{stud_list.student_count}"

stud_list.data_type = yaml_strategy
stud_list.save_to_file('D:/RubyMine Projects/Programming-patterns/Lab_2/Task_4/students_strategy_yaml.yaml')
puts "Кол-во студентов yaml: #{stud_list.student_count}"

# stud_list_yaml = StudentListBase.new(yaml_strategy)
# stud_list_yaml.add_student(student4)
# stud_list_yaml.add_student(student5)
# stud_list_yaml.add_student(student6)
# stud_list_yaml.save_to_file('D:/RubyMine Projects/Programming-patterns/Lab_2/Task_4/students_yaml.yaml')
# stud_list_yaml.load_from_file('D:/RubyMine Projects/Programming-patterns/Lab_2/Task_4/students_yaml.yaml')
# puts "Кол-во студентов yaml: #{stud_list_json.student_count}"

puts '//////////////'
puts 'Unit-tests'

student15 = Student.from_hash(last_name: "Алексеевич", first_name: "Никита", surname: "Сорока")
student15_new = student15.to_hash