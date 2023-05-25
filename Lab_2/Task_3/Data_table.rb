class Data_table
  attr_reader :data
  def initialize(data)
    @data = data
  end

  # Сеттер для замены массива объектов
  def set_data(new_data)
    @data = new_data.map.with_index do |row, i|
      row.map.with_index { |element, j| element.nil? ? get_element(i, j) : element }
    end
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

# Экземпляр класса Data_table
table = Data_table.new([
                         ["Имя", "Возраст", "City"],
                         ["Сева", 25, "Лондон"],
                         ["Никита", 40, "Краснодар"],
                         ["Артур", 55, "Париж"]
                       ])

# Исходная таблица
puts "Original Table:"
table.data.each { |row| puts row.join(", ") }

# Новый массив объектов
new_data = [
  [nil, nil, nil],
  [nil, nil, "Токио"],
  ["Ева", 30, nil],
  ["Алиса", nil, "Берлин"]
]

# Заменяем массива
table.set_data(new_data)

# Новая таблица
puts "Modified Table:"
table.data.each { |row| puts row.join(", ") }