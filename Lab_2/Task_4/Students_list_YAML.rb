require 'yaml'

class StudentsListYAML
  attr_reader :students

  def initialize(file_path)
    @file_path = file_path
    load_students_from_file
  end

  def load_students_from_file
    if File.exist?(@file_path)
      @students = YAML.load_file(@file_path) || []
    else
      @students = []
    end
  end

  def save_students_to_file
    File.open(@file_path, 'w') do |file|
      file.write(YAML.dump(@students))
    end
  end

  def get_student_by_id(id)
    @students.find { |student| student['id'] == id }
  end

  def get_k_n_student_short_list(k, n, data_list = nil)
    data_list ||= Data_list.new

    selected_students = @students[k...k + n]
    selected_students.each do |student|
      data_list.select(Student_short.new(student['id'], student['name']))
    end

    data_list
  end

  def sort_students_by_name
    @students.sort_by! { |student| student['name'] }
  end

  def add_student(student)
    student['id'] = generate_new_id
    @students << student
  end

  def replace_student_by_id(id, new_student)
    index = @students.find_index { |student| student['id'] == id }
    return unless index

    new_student['id'] = id
    @students[index] = new_student
  end

  def remove_student_by_id(id)
    @students.reject! { |student| student['id'] == id }
  end

  def get_student_short_count
    @students.size
  end

  private

  def generate_new_id
    max_id = @students.map { |student| student['id'] }.max || 0
    max_id + 1
  end
end