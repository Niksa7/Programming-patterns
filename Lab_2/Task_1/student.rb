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
    validate
  end

  def set_contacts(email: self.email, telegram: self.telegram, phone: self.phone, git: self.git)
    @phone = phone if self.class.valid_phone?(phone)
    @telegram = telegram if self.class.valid_telegram?(telegram)
    @email = email if self.class.valid_email?(email)
    @git = git if self.class.valid_git?(git)
  end

  # Поиск средства связи для get_info
  def find_contacts
    return "#{@phone}" unless phone.nil?
    return "#{@email}" unless email.nil?
    return "#{@telegram}" unless telegram.nil?
    nil
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
  def self.valid_phone?(phone)
    phone.nil? || phone.match?(/^((\+7|7|8)+([0-9]){10})$/)
  end
  def self.valid_telegram?(value)
    value.nil? || value.match?(/^@([A-Za-z0-9_-])+$/)
  end
  def self.valid_git?(value)
    value.nil? || value.match?(/^(https:\/\/)?(www\.)?github\.com\/([a-zA-Z0-9_-]+)\/?$/)
  end
  def self.valid_email?(value)
    value.nil? || value.match?(/^[A-Za-z0-9]+@(gmail|mail|inbox)\.(com|ru)/)
  end
  #Сеттеры
  def phone=(value)
    raise ArgumentError, "Недопустимый формат телефонного номера" unless self.class.valid_phone?(value)
    @phone = value
  end
  def telegram=(value)
    raise ArgumentError, "Недопустимый формат telegram" unless self.class.valid_telegram?(value)
    @telegram = value
  end
  def email=(value)
    raise ArgumentError, "Недопустимый формат email" unless self.class.valid_email?(value)
    @email = value
  end
  def git=(value)
    raise ArgumentError, "Недопустимый формат git" unless self.class.valid_git?(value)
    @git = value
  end
  #Информация об объекте
  def to_s
    puts "Фамилия: #{surname}\nИмя: #{name}\nОтчество: #{lastname}\nID: #{id}\nТелефон: #{phone}\nТелеграм:#{telegram}\nПочта: #{email}\nGit: #{git}\n"
  end
  #Метод validate
  def validate
    validate_git
    validate_contact
  end
  def validate_git
    raise ArgumentError, "Недопустимый формат git" unless self.class.valid_git?(@git)
  end
  def validate_contact
    raise ArgumentError, "Должно быть предоставлено хотя бы одно средство связи" if self.class.valid_phone?(@phone) && self.class.valid_telegram?(@telegram) && self.class.valid_email?(@email)
  end
end