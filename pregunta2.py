import sympy as sp
import numpy as np
import matplotlib.pyplot as plt
import time

"""
    Método de diferencias finitas para aproximar soluciones de ecuaciones de segundo orden
    
    Entradas:
        - p: función en variable x que multiplica a y'
        - q: función en variable x que multiplica a y
        - f: función en variable x que suma al final de la ecuación
        - h: espacio entre muestra y muestra para la aproximación
        - a: inicio del intervalo a aproximar
        - b: final del intervalo a aproximar
        - y0: condición inicial para x = a
        - yn: condición inicial para x = b
    
    Salidas:
        - x: valores en x en los que se parte el intervalo para aproximar la solución
        - y: valores en y de la solución aproximada
"""
def edo2(p, q, f, h, a, b, y0, yn):
    p = sp.sympify(p)
    q = sp.sympify(q)
    f = sp.sympify(f)
    n = int((b-a)/h)
    A = np.zeros((n-1, n-1))
    bx = np.zeros(n-1)
    y = np.zeros(n+1)
    x = np.zeros(n+1)
    y[0] = y0
    y[n] = yn
    x[0] = a
    x[n] = b
    for i in range(n-1):
        xn = a + (i+1)*h
        x[i+1] = xn
        p_eval = sp.N(p.subs("x", xn))
        q_eval = sp.N(q.subs("x", xn))
        f_eval = sp.N(f.subs("x", xn))
        for j in range(n-1):
            if (i == j):
                A[i, j] = 2 + (h**2)* q_eval
            elif (i == j-1):
                A[i, j] = (h/2)*p_eval - 1
            elif (i == j+1):
                A[i, j] = (-h/2)*p_eval - 1
        if i == 0:
            bx[i] = -(h**2)*(f_eval) + ((h/2)*p_eval + 1)*y0
        elif i == n-2:
            bx[i] = -(h**2)*(f_eval) + ((-h/2)*p_eval + 1)*yn
        else:
            bx[i] = -(h**2)*(f_eval)
    y[1:n] = np.linalg.solve(A,bx)
    return x, y

#Definición de los valores iniciales para la solución del problema solicitado
p = "-1/x"
q = "(1/(4*x**2))-1"
f = "0"
a = 1
b = 6
y0 = 1
yn = 0
h = 0       

#Set de las propiedades del plot para empezar a graficar las diferentes aproximaciones para diferentes valores de h       
fig, ax = plt.subplots()
ax.set_xlabel('x')
ax.set_ylabel('y')
ax.set_title('Aproximación de la EDO2')
plt.grid(True)

#Plot de la función original
x = np.linspace(1, 6, 100)
y = (np.sin(6-x))/(np.sin(5)*x**(1/2))
ax.plot(x, y, label = "Original")
plt.pause(2)

#Plot de las aproximaciones para 10 valores distintos de h
for i in range(10):
    h = 2**(-i)
    x, y = edo2(p, q, f, h, a, b, y0, yn)
    ax.plot(x, y, label = "Para h = "+str(h), linestyle='dashed')
    ax.legend()
    plt.pause(2)
    
plt.show()