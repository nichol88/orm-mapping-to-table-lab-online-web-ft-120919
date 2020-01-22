class Student
  attr_accessor :name, :grade
  attr_reader :id
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  def initialize(name, grade)
    @id = nil
    @name = name
    @grade = grade
  end

  def self.create_table(name, grade)
    sql <<-SQL
    CREATE TABLE IF NOT EXISTS students (
      id INTEGER PRIMARY KEY,
      name TEXT,
      grade INTEGER
    )
    VALUES (? , ?)
    SQL
    sql.execute()
  end

  def self.drop_table

  end
end
