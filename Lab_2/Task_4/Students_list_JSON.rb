require_relative 'strategy'
require 'json'

class StudentListJSON < Strategy

  public_class_method :new

  def str_to_list(str)
    JSON.parse(str, { symbolize_names: true })
  end

  def list_to_str(list)
    JSON.generate(list)
  end

end