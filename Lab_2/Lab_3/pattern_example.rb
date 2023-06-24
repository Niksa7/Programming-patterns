# frozen_string_literal: true

class SingletonClass

  def self.instance
    @@instance ||= new
  end

  private_class_method :new

  def print_message
    puts "Hello, world!"
  end
end

singleton_obj1 = SingletonClass.instance
singleton_obj2 = SingletonClass.instance

# true
puts singleton_obj1 == singleton_obj2

# Hello, world!
singleton_obj1.print_message