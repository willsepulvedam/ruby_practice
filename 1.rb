# frozen_string_literal: true


@materias = []
@carreras = []
@precios = {}

def mostrar_menus
  puts 'Bienvenido al sistema de universidades.'
  puts 'Por favor, seleccione una opción:'
  puts '1. Ver materias disponibles.'
  puts '2. Agregar materia.'
  puts '3. Ver carreras disponibles.'
  puts '4. Agregar carrera.'
  puts '5. Ver precio de carrera.'
  puts '6. Cancelar materia.'
  puts '7. Salir.'
end

def ver_materias
  if Array.length(@materias).zero?
    puts 'No hay materias disponibles.'

  else
    puts 'Las materias disponibles son:'
    @materias.each do |materia|
      puts(materia)
    end

  end
end

def agregar_materia
  puts 'Por favor, ingrese el nombre de la nueva materia: '
  nueva_materia = gets
  @materias.append(nueva_materia)
  puts 'La materia ha sido agregada exitosamente.'
end

def ver_carreras
  if Array.length(@carreras).zero?
    puts 'No hay carreras disponibles.'

  else
    puts 'Las carreras disponibles son:'
    @carreras.each do |carrera|
      puts(carrera)
    end

  end
end

def agregar_carrera # rubocop:disable Lint/RedundantCopDisableDirective
  puts 'Por favor, ingrese el nombre de la nueva carrera: '
  nueva_carrera = gets
  puts 'Por favor, ingrese el precio de la carrera: '
  precio_carrera = gets
  @carreras.append(nueva_carrera)
  @precios[nueva_carrera] = precio_carrera
  puts 'La carrera ha sido agregada exitosamente.'
end

def ver_precio_carrera
  puts 'Por favor, ingrese el nombre de la carrera: '
  carrera = gets
  if carrera n @precios
    puts "El precio de la carrera es: #{precios[carrera]}"
  else
    puts 'la carrera no existe.'
  end
end

def cancelar_materia
  puts 'Por favor, ingrese el nombre de la materia a cancelar: '
  materia = gets
  if materia n @materias
    @materias.remove(materia)
    puts 'La materia ha sido cancelada exitosamente.'
  else
    puts 'la materia no existe.'
  end
end

loop do
  mostrar_menus
  puts 'Opción seleccionada: '
  opcion = gets.chomp.to_i

  case opcion
  when 1
    ver_materias
  when 2
    agregar_materia
  when 3
    ver_carreras
  when 4
    agregar_carrera
  when 5
    ver_precio_carrera
  when 6
    cancelar_materia
  when 7
    puts 'Gracias por utilizar el sistema de universidades.'
  else
    puts 'Opción inválida.'
  end
end
