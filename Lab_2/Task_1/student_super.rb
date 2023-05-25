class Student_super
  private_class_method :new

  public

  attr_reader :phone, :email, :telegram, :git
  attr_accessor :id

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
  def set_contacts(email: self.email, telegram: self.telegram, phone: self.phone, git: self.git)
    @phone = phone if self.class.valid_phone?(phone)
    @telegram = telegram if self.class.valid_telegram?(telegram)
    @email = email if self.class.valid_email?(email)
    @git = git if self.class.valid_git?(git)
  end

  # public

  # Валидация
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

  # Поиск средства связи для get_info
  def find_contacts
    return "#{@phone}" unless phone.nil?
    return "#{@email}" unless email.nil?
    return "#{@telegram}" unless telegram.nil?
    nil
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
    valid_phone = self.class.valid_phone?(@phone)
    valid_telegram = self.class.valid_telegram?(@telegram)
    valid_email = self.class.valid_email?(@email)

    raise ArgumentError, "Должно быть предоставлено хотя бы одно средство связи" unless valid_phone || valid_telegram || valid_email
  end

end