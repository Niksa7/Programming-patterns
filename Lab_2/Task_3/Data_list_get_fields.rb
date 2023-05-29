require_relative 'Data_list'
require_relative 'Data_table'

class DataListStudentLab<DataList
  public_class_method :new

  protected
  def get_fields(object)
    [object.id, object.full_name, object.contact]
  end

end