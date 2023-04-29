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
  def self.valid_name?(value)
    value.nil? || value.match?(/^[A-Za-zА-Яа-я]+$/)
  end
  def self.valid_phone?(phone)
    phone.nil? || phone.match?(/^((\+7|7|8)+([0-9]){10})$/)
  end
  def self.valid_telegram?(value)
    value.nil? || value.match?(/^@[A-Za-z0-9_-]+$/)
  end
  def self.valid_git?(value)
    value.nil? || value.match?(/\Ahttps:\/\/github\.com\/[a-zA-Z0-9]+\z/)
  end
  def self.valid_email?(value)
    value.nil? || value.match?(/^[A-Za-z0-9]+@(gmail)\.(com)/)
  end
  #Сеттеры
  def phone=(value)
    raise ArgumentError, "Недопустимый формат телефонного номера" unless self.class.valid_phone?(value)
    @phone = value
  end
  def telegram=(value)
    raise ArgumentError, "Недопустимый формат" unless self.class.valid_telegram?(value)
    @telegram = value
  end
  def email=(value)
    raise ArgumentError, "Недопустимый формат" unless self.class.valid_email?(value)
    @email = value
  end
  def git=(value)
    raise ArgumentError, "Недопустимый формат" unless self.class.valid_git?(value)
    @git = value
  end
  #Информация об объекте
  def to_s
    puts "Фамилия: #{surname}\nИмя: #{name}\nОтчество: #{lastname}\nID: #{id}\nТелефон: #{phone}\nТелеграм:#{telegram}\nПочта: #{email}\nGit: #{git}\n"
  end

end