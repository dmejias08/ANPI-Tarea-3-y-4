% Esta función realiza la integración iterativa por el método de cuadratura gaussiana compuesta,
% utilizando la fórmula de la cuadratura gaussiana para calcular la integral definida de una función en un intervalo dado.
% Toma como entrada la función a integrar `f`, los límites de integración `a` y `b`,
% el orden de la cuadratura `M`, la tolerancia `tol` y el número máximo de iteraciones `iterMax`.
% Devuelve una aproximación de la integral definida.
%
% Uso: [I] = gaussiana_compuesta_iterativa(f, a, b, M, tol, iterMax)
%
% Argumentos:
% - f: La función a integrar como una cadena de texto.
% - a: El límite inferior de integración.
% - b: El límite superior de integración.
% - M: El orden de la cuadratura gaussiana.
% - tol: La tolerancia para el criterio de convergencia.
% - iterMax: El número máximo de iteraciones.
%
% Salida:
% - I: La aproximación de la integral definida.
%
% Esta función utiliza la función `gaussiana_compuesta` para realizar la cuadratura gaussiana compuesta en cada iteración,
% actualizando el número de subintervalos según el número de iteración.

function [I] = gaussiana_compuesta_iterativa(f, a, b, M, tol, iterMax)

  sk = 0;
  sk_1 = 0;

  for k=2:iterMax
    sk_1 = gaussiana_compuesta(f, a, b, M, k);
    error = abs(sk_1 - sk) / abs(sk_1);

    if (error < tol)
      break
    endif

    sk = sk_1;
  endfor
  I = sk_1;

  endfunction
