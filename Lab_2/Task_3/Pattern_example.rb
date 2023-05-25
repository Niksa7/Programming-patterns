class Main_class
  def prepare
    method_1
    method_2
  end
  def method_1
    raise NotImplementedError, "Метод реализуется подклассом"
  end
  def method_2
    raise NotImplementedError, "Метод реализуется подклассом"
  end
end

class Subclass < Main_class
  def method_1
    puts "Выполнен первый метод подкласса"
  end
  def method_2
    puts "Выполнен второй метод подкласса"
  end
end

# Вызов абстрактного класса
main = Main_class.new
main.prepare

# Вызов подкласса
sub = Subclass.new
sub.prepare
