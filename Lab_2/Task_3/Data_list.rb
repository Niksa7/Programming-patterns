class Data_list
  attr_reader :data

  # private_class_method :new

  def initialize(*data)
    @data = data
    @sum_of_selected = []
  end

  def select(number)
    @sum_of_selected << @data[number]
  end

  def get_selected # Массив идентификаторов элементов sum_of_selected
    @sum_of_selected.map{|element| element.id}
  end

  def get_names
    raise NotImplementedError, "Этот метод реализовывается в подклассах"
  end

  def get_data
    raise NotImplementedError, "Этот метод реализовывается в подклассах"
  end

  def replace_data(data)
    self.data = data.dup
  end
end