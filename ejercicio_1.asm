.data ##Declaracion de variables
num1: .word 9
num2: .word 5
num3: .word 10

.text
main:
	## Carga los valores en los registros
	lw $t0, num1
	lw $t1, num2
	lw $t2, num3
	
	## num1 >= num2 si cumple corre la funcion validate_num3
	bgt $t0, $t1, validate_num3
	
	## num2 >= num3 si cumple corre la funcion print_console_num2
	bgt $t1, $t2, print_console_num2
	
validate_num3:

	## num1 >= num3 si cumple corre la funcion print_console_num1
	bgt $t0, $t2, print_console_num1
	
	## Si no cuple la sentencia anterior corre la funcion print_console_num3
	j print_console_num3
	
print_console_num1:

	## Guarda en $t3 el valor de num1
	move $t3, $t0
	
	## Ejecuta la funcion de print_console
	j print_console
	
print_console_num2:

	## Guarda en $t3 el valor de num2
	move $t3, $t1
	
	## Ejecuta la funcion de print_console
	j print_console
	
print_console_num3:

	## Guarda en $t3 el valor de num3
	move $t3, $t2
	
	## Ejecuta la funcion de print_console
	j print_console


print_console:
	## Código de servicio 1 para imprimir un entero
	li $v0, 1
	## Guarda el numero maximo en $a0
	move $a0, $t3    
	## Imprime por consola
	syscall
	
	## Código de servicio 0 para salir del programa
	li $v0, 10
	## Termina el Programa
	syscall