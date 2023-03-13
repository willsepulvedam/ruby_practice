# frozen_string_literal: true

require 'sqlite3'

# Description/Explanation of Person class
class Career
  attr_accessor :id, :name, :price, :subjects

  def initialize(name, price)
    @name = name
    @price = price
    @subjects = []
  end

  def self.all
    db = SQLite3::Database.new('university.db')
    db.results_as_hash = true

    careers = []

    db.execute('SELECT * FROM careers') do |row|
      career = career.new(row['name'], row['price'])
      career.id = row['id']

      career.subjects = Subject.all_by_career(career.id)

      careers << career
    end

    careers
  end

  def self.find(id)
    db = SQLite3::Database.new('university.db')
    db.results_as_hash = true

    row = db.get_first_row('SELECT * FROM careers WHERE id = ?', id)

    career = career.new(row['name'], row['price'])
    career.id = row['id']

    career.subjects = Subject.all_by_career(career.id)

    career
  end

  def save
    db = SQLite3::Database.new('university.db')

    if @id.nil?
      db.execute('INSERT INTO careers (name, price) VALUES (?, ?)', [@name, @price])
      @id = db.last_insert_row_id
    else
      db.execute('UPDATE careers SET name = ?, price = ? WHERE id = ?', [@name, @price, @id])
    end
  end

  def delete
    db = SQLite3::Database.new('university.db')
    db.execute('DELETE FROM careers WHERE id = ?', [@id])
  end
end

# Description/Explanation of Person class
class Subject
  attr_accessor :id, :name, :career_id

  def initialize(name, career_id)
    @name = name
    @career_id = career_id
  end

  def self.all
    db = SQLite3::Database.new('university.db')
    db.results_as_hash = true

    subjects = []

    db.execute('SELECT * FROM subjects') do |row|
      subject = Subject.new(row['name'], row['career_id'])
      subject.id = row['id']

      subjects << subject
    end

    subjects
  end

  def self.all_by_career(career_id)
    db = SQLite3::Database.new('university.db')
    db.results_as_hash = true
    subjects = []

    db.execute('SELECT * FROM subjects WHERE career_id = ?', career_id)
    subjects
  end
  db.close if db
end

