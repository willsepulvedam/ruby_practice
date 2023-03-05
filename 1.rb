@materias = []
@carreras = []
@precios = {}

def mostrarMenus()
    puts "Bienvenido al sistema de universidades."
    puts "Por favor, seleccione una opción:"
    puts "1. Ver materias disponibles."
    puts "2. Agregar materia."
    puts "3. Ver carreras disponibles."
    puts "4. Agregar carrera."
    puts "5. Ver precio de carrera."
    puts "6. Cancelar materia."
    puts "7. Salir."
end

def verMaterias()
    if Array.length(materias) == 0
        puts "No hay materias disponibles."
        
    else
        puts "Las materias disponibles son:"
        for materia in materias
            puts (materia)
            
        end
        
    end
end

def agregarMateria()
    puts "Por favor, ingrese el nombre de la nueva materia: "
    nuevaMateria = gets
    materias.append(nuevaMateria)
    puts "La materia ha sido agregada exitosamente."
end

def verCarreras()
    if Array.length(carreras) == 0
        puts "No hay carreras disponibles."
        
    else
        puts "Las carreras disponibles son:"
        for carrera in carreras
            puts (carrera)
            
        end
        
    end
end

def agregarCarrera()
    puts "Por favor, ingrese el nombre de la nueva carrera: "
    nuevaCarrera = gets
    puts "Por favor, ingrese el precio de la carrera: "
    precioCarrera = gets
    carreras.append(nuevaCarrera)
    precios[nuevaCarrera] = precioCarrera
    puts "La carrera ha sido agregada exitosamente."
end

def verPrecioCarrera()
    puts "Por favor, ingrese el nombre de la carrera: "
    carrera = gets
    if carrera in precios
        puts "El precio de la carrera es: " + precios[carrera]
    else
        puts "la carrera no existe."
    end
end


def cancelarMateria()
    puts "Por favor, ingrese el nombre de la materia a cancelar: "
    materia = gets
    if materia in materias
        materias.remove(materia)
        puts "La materia ha sido cancelada exitosamente."
    else
        puts "la materia no existe."
    
    end
end

while true
    mostrarMenus()
    puts "Opción seleccionada: "
    opcion = gets

    if opcion == "1"
        verMaterias()
    elsif opcion == "2"
        agregarMateria()
    elsif opcion == "3"
        verCarreras()
    elsif opcion == "4"
        agregarCarrera()
    elsif opcion == "5"
        verPrecioCarrera()
    elsif opcion == "6"
        cancelarMateria()
    elsif opcion == "7"
        puts "Gracias por utilizar el sistema de universidades."
    else
        puts "Opción inválida."
    end
end
