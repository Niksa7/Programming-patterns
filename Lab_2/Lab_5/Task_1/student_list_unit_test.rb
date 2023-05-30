require 'rspec'
require_relative '../../Task_1/student'

RSpec.describe Student do

  # Проверка конструктора
  describe '#initialize' do
    it 'Проверка конструктора класса Student' do
      student = Student.new('Артемов', 'Артем', 'Артемович', phone: "+78925121826", telegram: '@artemov')
      expect(student.lastname).to eq('Артемович')
      expect(student.name).to eq('Артем')
      expect(student.surname).to eq('Артемов')
      expect(student.telegram).to eq('@artemov')
      expect(student.phone).to eq("+78925121826")
    end
  end

  # Проинициализируем данные для проверки
  let(:valid_phone) { '+78925121826' }
  let(:invalid_phone) { '880055533' }
  let(:valid_name) { 'Олег' }
  let(:invalid_name) { 'Oleg512' }
  let(:valid_telegram) { '@olegggg' }
  let(:invalid_telegram) { 'username' }
  let(:valid_email) { 'olesha1996@gmail.com' }
  let(:invalid_email) { 'example@com' }

  # Проверка валидации телефона
  describe '.valid_phone?' do
    it 'Возвращает true, если телефон записан правильно' do
      expect(Student.valid_phone?(valid_phone)).to be true
    end

    it 'Возвращает false, если телефон записан неправильно' do
      expect(Student.valid_phone?(invalid_phone)).to be false
    end
  end

  # Проверка валидации имени
  describe '.valid_name?' do
    it 'Возвращает true, если имя записано правильно' do
      expect(Student.valid_name?(valid_name)).to be true
    end

    it 'Возвращает false, если имя записано неправильно' do
      expect(Student.valid_name?(invalid_name)).to be false
    end
  end

  # Проверка валидации телеграмма
  describe '.valid_telegram?' do
    it 'Возвращает true, если телеграмм записан правильно' do
      expect(Student.valid_telegram?(valid_telegram)).to be true
    end

    it 'Возвращает false, если телеграмм записан неправильно' do
      expect(Student.valid_telegram?(invalid_telegram)).to be false
    end
  end

  # Проверка валидации почты
  describe '.valid_email?' do
    it 'Возвращает true, если почта записана правильно' do
      expect(Student.valid_email?(valid_email)).to be true
    end

    it 'Возвращает false, если почта записана неправильно' do
      expect(Student.valid_email?(invalid_email)).to be false
    end
  end
end