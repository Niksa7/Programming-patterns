require 'json'

class StudentsListJSON
  def initialize(file_path)
    @file_path = file_path
    @students = load_students_from_file
  end

  # Чтение из файла
  def read_all
    @students
  end

  # Запись в файл
  def write_all
    save_students_to_file
  end

  # Получение студента по его id
  def get_student_by_id(id)
    @students.detect { |student| student.id == id }
  end

  # Получение списка k по счету n элементов
  def get_k_n_student_short_list(k, n, data_list = nil)
    data_list ||= Data_list.new

    start_index = (k - 1) * n
    end_index = start_index + n - 1
    selected_students = @students[start_index..end_index]

    selected_students.each do |student|
      data_list.select(Student_short.from_object(student))
    end

    data_list
  end

  # Отсортировать по фамилии
  def sort_by_last_name
    @students.sort_by! { |student| student.lastname }
  end

  #  Добавить студента
  def add_student(student)
    student.id = generate_new_id
    @students << student
  end

  # Заменить студента по id
  def replace_student(student)
    index = @students.find_index { |s| s.id == student.id }
    @students[index] = student if index
  end

  # Удалить студента
  def remove_student(id)
    @students.reject! { |student| student.id == id }
  end

  # Количество студентов
  def get_student_short_count
    @students.size
  end

  private

  def load_students_from_file
    json_data = File.read(@file_path)
    students_data = JSON.parse(json_data, symbolize_names: true)
    students_data.map { |student_data| Student.new(*student_data) }
  end

  def save_students_to_file
    File.write(@file_path, @students.map(&:to_json).to_json)
  end

  private

  def generate_new_id
    # Поиск максимального id
    max_id = @students.map(&:id).max || 0
    max_id + 1
  end
end