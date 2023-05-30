# Определение основного класса, который будет использовать стратегии
class Abstract
  def initialize(strategy)
    @strategy = strategy
  end

  def execute_strategy(data)
    @strategy.execute(data)
  end
end

# Определение интерфейса стратегий
class Strategy
  def execute(data)
    raise NotImplementedError, 'Subclasses must override this method'
  end
end

# Реализация конкретной стратегии
class ConcreteStrategyA < Strategy
  def execute(data)
    puts "Executing strategy A with data: #{data}"
    # Добавьте свою логику выполнения стратегии A здесь
  end
end

# Реализация другой конкретной стратегии
class ConcreteStrategyB < Strategy
  def execute(data)
    puts "Executing strategy B with data: #{data}"
    # Добавьте свою логику выполнения стратегии B здесь
  end
end

# Пример использования
# Создание контекста и передача ему конкретной стратегии
context = Context.new(ConcreteStrategyA.new)

# Выполнение стратегии
context.execute_strategy('some data')

# Изменение стратегии во время выполнения
context = Context.new(ConcreteStrategyB.new)
context.execute_strategy('other data')