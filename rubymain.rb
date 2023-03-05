class Carrera
    attr_accessor :id, :nombre, :precio, :materias
  
    def initialize(nombre, precio)
      @nombre = nombre
      @precio = precio
      @materias = []
    end
  
    def self.all
      db = SQLite3::Database.new('universidad.db')
      db.results_as_hash = true
  
      carreras = []
  
      db.execute("SELECT * FROM carreras") do |row|
        carrera = Carrera.new(row['nombre'], row['precio'])
        carrera.id = row['id']
  
        carrera.materias = Materia.all_by_carrera(carrera.id)
  
        carreras << carrera
      end
  
      carreras
    end
  
    def self.find(id)
      db = SQLite3::Database.new('universidad.db')
      db.results_as_hash = true
  
      row = db.get_first_row("SELECT * FROM carreras WHERE id = ?", id)
  
      carrera = Carrera.new(row['nombre'], row['precio'])
      carrera.id = row['id']
  
      carrera.materias = Materia.all_by_carrera(carrera.id)
  
      carrera
    end
  
    def save
      db = SQLite3::Database.new('universidad.db')
  
      if @id.nil?
        db.execute("INSERT INTO carreras (nombre, precio) VALUES (?, ?)", [@nombre, @precio])
        @id = db.last_insert_row_id
      else
        db.execute("UPDATE carreras SET nombre = ?, precio = ? WHERE id = ?", [@nombre, @precio, @id])
      end
    end
  
    def delete
      db = SQLite3::Database.new('universidad.db')
      db.execute("DELETE FROM carreras WHERE id = ?", [@id])
    end
end
   
  class Materia
    attr_accessor :id, :nombre, :carrera_id
  
    def initialize(nombre, carrera_id)
      @nombre = nombre
      @carrera_id = carrera_id
    end
  
    def self.all
      db = SQLite3::Database.new('universidad.db')
      db.results_as_hash = true
  
      materias = []
  
      db.execute("SELECT * FROM materias") do |row|
        materia = Materia.new(row['nombre'], row['carrera_id'])
        materia.id = row['id']
  
        materias << materia
      end
  
      materias
    end
  
    def self.all_by_carrera(carrera_id)
      db = SQLite3::Database.new('universidad.db')
      db.results_as_hash = true
  
      materias = []
    puts materias
      db.execute("SELECT * FROM materias WHERE carrera_id = ?", carrera_id
        
      end