// calculadora.c
#include <stdio.h>
#include "biblioteca.h"

int main() {
    double a = 10.0, b = 5.0;
    
    printf("Suma: %.2f\n", suma(a, b));
    printf("Resta: %.2f\n", resta(a, b));
    printf("Multiplicación: %.2f\n", multiplicacion(a, b));
    printf("División: %.2f\n", division(a, b));
    printf("Raíz Cuadrada: %.2f\n", raiz_cuadrada(a));
    printf("Coseno: %.2f\n", coseno(a));

    return 0;
}
