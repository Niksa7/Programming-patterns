require_relative 'student'
require_relative 'student_short'

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

