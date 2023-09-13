.data
	# Declaración de variables
	max_value: .word 100
	result: .space 4
	separation: .asciiz ", "
	
.text
main:
	# Carga max_vaule (numero maximo de la sucesión) en el registro $t0
	lw $t0, max_value
	
	# Inicializa los registros necesarios
	li $t1, 0
	li $t2, 1
	
	## Ejecuta la funcion fibonacci_loop
	j fibonacci_loop
    
fibonacci_loop:
	## Imprime en consola el valor actual de la secuencia de Fibonacci
	li $v0, 1
	## Guarda el numero actual de la secuencia en $a0
	move $a0, $t1
	## Imprime por consola
	syscall
	
	## Imprime en consola la separacion y poderlo leer
	li $v0, 4
	## Guarda la separacion en $a0
	la $a0, separation
	## Imprime por consola
	syscall
	
	## Suma $t1 y $t2, y lo almacena en el registro $t3
	add $t3, $t1, $t2
    
	# Comprobar si hemos alcanzado o superado el valor máximo si cuple ejecuta la funcion end_program
	bge $t3, $t0, end_program
	
	# Actualiza los registros para la siguiente iteración
	move $t1, $t2
	move $t2, $t3
	
	# Ejecuta la funcion fibonacci_loop para volver al inicio del bucle
	j fibonacci_loop
	
end_program:
	## Código de servicio 10 para salir del programa
	li $v0, 10
	## Termina el programa
	syscall