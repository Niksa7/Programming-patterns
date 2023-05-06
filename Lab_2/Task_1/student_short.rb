require_relative 'student_super'

class Student_short < Student_super
  public_class_method :new

  attr_reader :id, :full_name, :git, :contact

  def initialize(id, info)
    @id = id
    parse_info(info)
  end

  def self.from_object(student)
    new(student.id, student.get_info)
  end

  private

  def parse_info(info)
    if info
      info_arr = info.split(", ")
    else
      info_arr = []
    end

    @full_name = info_arr[0]
    @git = info_arr[1]
    @contact = info_arr[2]
  end
end
