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

  def self.create_table
    <<-SQL
    CREATE TABLE IF NOT EXISTS students (
      id INTEGER PRIMARY KEY,
      name TEXT,
      grade INTEGER
    )
    VALUES (? , ?)
    SQL
  end

  def self.drop_table
    <<-SQL
    DROP TABLE students
    SQL
  end

  def save(name, grade)
    <<-SQL
    INSERT INTO students
    VALUES (? , ?)
    SQL
    sql.execute(sql, name, grade)
  end
end
