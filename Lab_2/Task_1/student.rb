require_relative 'student_super'
class Student < Student_super
  public_class_method :new

  attr_accessor :surname, :name, :lastname

  def initialize(surname , name , lastname , attribut = {})
    @surname = surname
    @name = name
    @lastname = lastname
    @id = attribut[:id]
    @phone = attribut[:phone]
    @telegram = attribut[:telegram]
    @email = attribut[:email]
    @git = attribut[:git]
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

  #Информация об объекте
  def to_s
    puts "Фамилия: #{surname}\nИмя: #{name}\nОтчество: #{lastname}\nID: #{id}\nТелефон: #{phone}\nТелеграм:#{telegram}\nПочта: #{email}\nGit: #{git}\n"
  end
end