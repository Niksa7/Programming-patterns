class Student
  attr_accessor :surname, :name, :lastname, :id, :phone, :telegram, :email, :git

  def initialize(surname , name , lastname , attribut = {})
    @surname = surname
    @name = name
    @lastname = lastname
    @id = attribut[:id]
    @phone = attribut[:phone]
    @telegram = attribut[:telegram]
    @email = attribut[:email]
    @git = attribut[:git]
  end
  #Валидация
  def self.valid_phone?(phone)
    phone.nil? || phone.match?(/^((\+7|7|8)+([0-9]){10})$/)
  end
  #Сеттеры
  def phone=(value)
    raise ArgumentError, "Недопустимый формат телефонного номера" unless self.class.valid_phone?(value)
    @phone = value
  end
  #Информация об объекте
  def info
    puts "Фамилия: #{surname}\nИмя: #{name}\nОтчество: #{lastname}\nID: #{id}\nТелефон: #{phone}\nТелеграм:#{telegram}\nПочта: #{email}\nGit: #{git}\n"
  end

end