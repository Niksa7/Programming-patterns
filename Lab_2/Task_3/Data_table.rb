class Data_table
  def initialize(data)
    @data = data
  end

  # Получить элемент таблицы
  def get_element(row, col)
    @data[row][col]
  end

  # Получить кол-во строк
  def row_count
    @data.size
  end
  # Получить кол-во столбцов
  def column_count
    @data[0].size
  end
end