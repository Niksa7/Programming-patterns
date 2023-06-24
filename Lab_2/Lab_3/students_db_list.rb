require_relative '../Task_1/student'
require_relative '../Task_1/student_short'
require_relative '../Task_3/Data_list_student_short'
require_relative 'studentsDB'
class StudentListDb

  #стандартный коструктор
  def initialize
    self.db = DB.instance
  end

  # получить студента по id
  def get_student_by_id(student_id)
    student_data = db.execute('SELECT * FROM students WHERE id = ?', student_id).first
    return nil if student_data.nil?

    Student.new(student_data['surname'], student_data['name'], student_data['lastname'], id: student_data['id'], phone: student_data['phone'], telegram: student_data['telegram'], email: student_data['email'], git: student_data['git'])
  end


  #добавление студента
  def add_student(student)
    db.execute('insert into students (surname, name, lastname, phone, telegram, email, git) VALUES (?, ?, ?, ?, ?, ?, ?)', *student_fields(student)).first
  end

  #удаление студента по id
  def remove_student(student_id)
    db.execute('DELETE FROM students WHERE id = ?', student_id)
  end

  #замена студента по id
  def replace_student(student_id, student)
    db.execute('UPDATE students SET surname=?, name=?, lastname=?, phone=?, telegram=?, email=?, git=? WHERE id=?',*student_fields(student), student_id)
  end

  #подсчет количества студентов
  def student_count
    db.results_as_hash=false
    res=db.execute("Select COUNT(*) from students").first[0]
    db.results_as_hash=true
    res
  end

  #полуение n элементов page страницы
  def get_k_n_student_short_list(page,n,data_list)
    students = db.execute('SELECT * FROM students LIMIT ?, ?',(page-1)*n,n)
    slice = students.map{|st| Student_short.from_object(st)}

    return DataListStudentShort.new(slice) if data_list.nil?
    data_list.replace_objects(slice)
    data_list
  end

  private

  attr_accessor :db

  def student_fields(student)
    [student.surname, student.name,  student.lastname, student.phone, student.telegram, student.email, student.git]
  end
end

