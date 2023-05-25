require_relative 'Data_list'

class Data_list_student_short < Data_list
  attr_accessor :data

  def get_names
    %w[git contact lastname]
  end

  def get_data(obj)
    [obj.git, obj.contact, obj.lastname]
  end

end