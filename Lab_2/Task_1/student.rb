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

  def info
    puts "Фамилия: #{surname}\nИмя: #{name}\nОтчество: #{lastname}\nID: #{id}\nТелефон: #{phone}\nТелеграм:#{telegram}\nПочта: #{email}\nGit: #{git}\n"
  end

end