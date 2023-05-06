require_relative 'student'

class Student_short < Student
  attr_reader :id, :name_initials, :git, :contact

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
