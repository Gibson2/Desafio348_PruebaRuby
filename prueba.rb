def menu(num_menu)
	
	file_1 = File.open("lista.csv", "r")
	data_1 = file_1.readlines()
	file_1.close

	menu_op = num_menu
	alumno = []
	a = 0

while a == 1
	
puts"___________________________
|Menu|_____________________
1. Reporte de Promedio por Alumno
2. Total de Inasistencias
3. Alumnos Aprobados
4. Exit
___________________________"

	if menu_op > 4 || menu_op == 0

		if a == 2
			menu_op = gets.chomp.to_i			
		else
			
			p "Opción Incorrecta"
			menu_op = gets.chomp.to_i
		end
	end

#Opción 1

	if menu_op == 1

	unless File.exists?("notas.txt")
		file = File.open("notas.txt", "w")
		file.close
	end

	suma = 0

		data_1.each_with_index do |valor, index|

		alumno = valor.chomp.split(", ")

		alumno.each_with_index do |e, i|  
			if i > 0
				if e == "A"
					suma += 0		
				else
					suma += e.to_i	
				end	
			end
		end
		p "aqui"
		prom = suma/5.0

		File.open("notas.txt",'a'){|f|
			f.puts "Alumno: "+ alumno[0] + " Promedio: #{prom}"
		}

		suma = 0

		end

		p "Se creó el archivo notas.txt en directorio"

		a = 2
	end

#Opción 2

	if menu_op == 2

	suma = 0

	data_1.each_with_index do |valor, index|

	alumno = valor.chomp.split(", ")

	alumno.each_with_index do |e, i|  
		if i > 0
			if e == "A"
				suma += 1	
			end	
		end
	end

	end

	p "Las Inasistencias totales fueron #{suma}"

	a = 2
	end

#Opción 3

	if menu_op == 3

	p "Por favor introducir el promedio de aprobación"
	p "Si no es seleccionado se colocara por defecto 5"
	promedio = gets.chomp.to_f
	suma = 0

	if promedio.nil?

		promedio = 5.0
		
	end

		data_1.each_with_index do |valor, index|

		alumno = valor.chomp.split(", ")

		alumno.each_with_index do |e, i|  
			
			if i > 0
				if e == "A"
					suma += 0		
				else
					suma += e.to_i	
				end	
			end
		end

		prom = suma/5.0

		if prom >= promedio
			p "Alumno: " + alumno[0] + " Aprobado"
		end

		suma = 0

		end
		a = 2
	end


#Opción 4

	if menu_op == 4

		a =1
		exit

	end
end
end

puts"___________________________
|Menu|_____________________
1. Reporte de Promedio por Alumno
2. Total de Inasistencias
3. Alumnos Aprobados
4. Exit
___________________________"


num_menu = gets.chomp.to_i

menu(num_menu)

