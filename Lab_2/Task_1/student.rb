require_relative 'student_super'
class Student < Student_super
  public_class_method :new

  attr_reader :surname, :name, :lastname

  def initialize(surname , name , lastname , attribut = {})
    self.surname = surname
    self.name = name
    self.lastname = lastname
    self.id = attribut[:id]
    set_contacts(phone: attribut[:phone], git: attribut[:git], telegram: attribut[:telegram], email: attribut[:email])
    # self.phone = attribut[:phone]
    # self.telegram = attribut[:telegram]
    # self.email = attribut[:email]
    # self.git = attribut[:git]
    validate
  end

  # Краткая информация о студенте
  def get_info
    contacts = "#{find_contacts}"
    puts "#{@surname} #{@name[0]}. #{@lastname[0]}., #{@git ? @git : '-'}, #{!contacts.empty? ? contacts : '-'}"
  end

  #Валидация
  def self.valid_name?(value)
    value.nil? || value.match?(/^[A-Za-zА-Яа-я]+$/)
  end
  # Сеттеры
  def surname=(value)
    raise ArgumentError, "Недопустимый формат телефонного номера" unless self.class.valid_name?(value)
    @surname = value
  end
  def name=(value)
    raise ArgumentError, "Недопустимый формат телефонного номера" unless self.class.valid_name?(value)
    @name = value
  end
  def lastname=(value)
    raise ArgumentError, "Недопустимый формат телефонного номера" unless self.class.valid_name?(value)
    @lastname = value
  end

  #Информация об объекте
  def to_s
    puts "Фамилия: #{surname}\nИмя: #{name}\nОтчество: #{lastname}\nID: #{id}\nТелефон: #{phone}\nТелеграм:#{telegram}\nПочта: #{email}\nGit: #{git}\n"
  end
end