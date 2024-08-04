# Definir el compilador
CC = gcc

# Definir las banderas de compilación
CFLAGS = -Wall -fPIC

# Definir los nombres de los archivos y las bibliotecas
STATIC_LIB = libbiblioteca.a
DYNAMIC_LIB = libbiblioteca.so
OBJECT_FILE = biblioteca.o
HEADER_FILE = biblioteca.h
SOURCE_FILE = biblioteca.c
CALCULADORA_SOURCE = calculadora.c
STATIC_EXEC = calculadora_estatica
DYNAMIC_EXEC = calculadora_dinamica

# Regla por defecto
all: $(STATIC_LIB) $(DYNAMIC_LIB) $(STATIC_EXEC) $(DYNAMIC_EXEC)

# Compilar el archivo objeto
$(OBJECT_FILE): $(SOURCE_FILE) $(HEADER_FILE)
	$(CC) $(CFLAGS) -c $(SOURCE_FILE) -o $(OBJECT_FILE)

# Crear la biblioteca estática
$(STATIC_LIB): $(OBJECT_FILE)
	ar rcs $(STATIC_LIB) $(OBJECT_FILE)

# Crear la biblioteca dinámica
$(DYNAMIC_LIB): $(OBJECT_FILE)
	$(CC) -shared -o $(DYNAMIC_LIB) $(OBJECT_FILE) -lm

# Compilar y enlazar con la biblioteca estática
$(STATIC_EXEC): $(CALCULADORA_SOURCE) $(STATIC_LIB) $(HEADER_FILE)
	$(CC) $(CALCULADORA_SOURCE) -L. -lbiblioteca -o $(STATIC_EXEC) -lm -static

# Compilar y enlazar con la biblioteca dinámica
$(DYNAMIC_EXEC): $(CALCULADORA_SOURCE) $(DYNAMIC_LIB) $(HEADER_FILE)
	$(CC) $(CALCULADORA_SOURCE) -L. -lbiblioteca -o $(DYNAMIC_EXEC) -lm

# Limpiar los archivos generados
clean:
	rm -f $(OBJECT_FILE) $(STATIC_LIB) $(DYNAMIC_LIB) $(STATIC_EXEC) $(DYNAMIC_EXEC)

# Ejecutar el programa con la biblioteca estática
run_static: $(STATIC_EXEC)
	./$(STATIC_EXEC)

# Ejecutar el programa con la biblioteca dinámica
run_dynamic: $(DYNAMIC_EXEC)
	LD_LIBRARY_PATH=. ./$(DYNAMIC_EXEC)
