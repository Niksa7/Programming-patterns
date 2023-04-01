class Student

  def initialize(surname: , name: , lastname: , id: nil, phone: nil, telegram: nil, email: nil, git: nil)
    @surname = surname
    @name = name
    @lastname = lastname
    @id = id
    @phone = phone
    @telegram = telegram
    @email = email
    @git = git
  end

  # геттеры
  def id
    @id
  end

  def name
    @name
  end

  def surname
    @surname
  end

  def lastname
    @lastname
  end

  def phone
    @phone
  end

  def telegram
    @telegram
  end

  def email
    @email
  end

  def git
    @git
  end

  # сеттеры
  def id=(id)
    @id = id
  end

  def name=(name)
    @name = name
  end

  def surname=(surname)
    @surname = surname
  end

  def lastname=(lastname)
    @lastname = lastname
  end

  def phone=(phone)
    @phone = phone
  end

  def telegram=(telegram)
    @telegram = telegram
  end

  def email=(email)
    @email = email
  end

  def git=(git)
    @git = git
  end


end