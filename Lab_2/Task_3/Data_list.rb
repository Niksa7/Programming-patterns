class DataList

  # private_class_method :new

  attr_writer :objects_list

  # конструктор
  def initialize(objects_list)
    self.objects_list = objects_list
    self.selected_objects = []
  end

  # добавить id в выборку
  def select(*numbers)
    selected_objects.append(*numbers)
  end

  # очистить массив выборки
  def clear_select
    self.selected_objects = []
  end

  #массив id выделенных элементов
  def get_select
    selected_objects.inject([]) {|res, index| res<<objects_list[index].id}
  end

  def clear_selected
    self.selected_objects = []
  end
  # применение паттерна Шаблон
  def get_names; end

  def get_data;
  end

  def replace_objects(objects_list)
    self.objects_list = objects_list.dup
  end

  protected
  attr_reader :objects_list
  attr_accessor :selected_objects


  # метод необходимо переопределять у наследников
  def get_fields(object)
    []
  end
end