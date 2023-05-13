class Data_table
  def initialize(data)
    @data = data
  end

  def get_element(row, col)
    @data[row][col]
  end

  def row_count
    @data.size
  end

  def column_count
    @data[0].size
  end
end