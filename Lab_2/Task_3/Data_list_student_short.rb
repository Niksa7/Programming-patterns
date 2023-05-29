require_relative 'Data_list'
require_relative 'Data_table'

class DataListStudentShort < DataList

  public_class_method :new

  def initialize(objects_list)
    super
  end

  # переопределение метода из предка
  def get_names
    %w[№ short_name git contact]
  end


  def get_data
    index_id=0
    dt = objects_list.inject([]) do |res, object|
      row=[index_id]
      row.append(*get_fields(object))
      index_id+=1
      res<<row
    end
    DataTable.new(dt)
  end

  protected

  # сеттер для массива объектов
  def get_fields(object)
    [object.full_name, object.git, object.contact]
  end

end






