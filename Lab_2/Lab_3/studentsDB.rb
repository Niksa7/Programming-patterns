require 'sqlite3'
class DB
  private_class_method :new
  @@instance = nil
  def initialize
    @db = SQLite3::Database.open "db_student.db"
    @db.results_as_hash=true
  end

  def self.instance
    if @@instance.nil?
      @@instance=new
    end
    @@instance
  end
  # выполняем переданный запрос к базе данных.
  def execute(query, *args)
    @db.execute(query, *args)
  end

  def results_as_hash=(bool)
    @db.results_as_hash=bool
  end

end