// biblioteca.c
#include "biblioteca.h"
#include <math.h>

double suma(double a, double b) {
    return a + b;
}

double resta(double a, double b) {
    return a - b;
}

double multiplicacion(double a, double b) {
    return a * b;
}

double division(double a, double b) {
    if (b != 0)
        return a / b;
    else
        return 0; // Manejo de error: división por cero
}

double raiz_cuadrada(double a) {
    if (a >= 0)
        return sqrt(a);
    else
        return 0; // Manejo de error: raíz cuadrada de número negativo
}

double coseno(double a) {
    return cos(a);
}
