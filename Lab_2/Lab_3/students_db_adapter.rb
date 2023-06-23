require_relative '../Task_1/student'
require_relative '../Task_1/student_short'
require_relative '../Task_3/Data_list_student_short'
require_relative 'studentsDB'
class StudentListDbAdapter

  #стандартный коструктор
  def initialize
    self.db = DB.instance
  end

  # получить студента по id
  def get_student_by_id(student_id)
    hash = db.execute('SELECT * FROM students WHERE id = ?', student_id).first
    return nil if hash.nil?
    Student.new(hash[0], hash[1], hash[2], **hash.transform_keys(&:to_sym))
  end


  #добавление студента
  def add_student(student)
    db.execute('insert into students (first_name, last_name, second_name, phone, telegram, email, git) VALUES (?, ?, ?, ?, ?, ?, ?)', *student_fields(student)).first
  end

  #удаление студента по id
  def remove_student(student_id)
    db.execute('DELETE FROM students WHERE id = ?', student_id)
  end

  #замена студента по id
  def replace_student(student_id, student)
    db.execute('UPDATE students SET first_name=?, last_name=?, second_name=?, phone=?, telegram=?, email=?, git=? WHERE id=?',*student_fields(student), student_id)
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
