require_relative 'student'

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
student2.to_s
#Проверка валидации
puts Student.valid_phone?('+79823784674')
puts Student.valid_telegram?('@NekiMan0')
puts Student.valid_git?('Vsevolod1817')
puts Student.valid_name?('Артем')
puts Student.valid_email?('nikitasoroka228@gmail.com')
