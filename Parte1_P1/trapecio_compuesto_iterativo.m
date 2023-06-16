% Esta función realiza la integración por el método del trapecio compuesto de manera iterativa,
% aumentando progresivamente el número de subintervalos hasta que se cumple una tolerancia de error o se alcanza el número máximo de iteraciones.
% Toma como entrada la función a integrar `f`, los límites de integración `a` y `b`,
% la tolerancia de error `tol` y el número máximo de iteraciones `iterMax`.
% Devuelve una aproximación de la integral definida.
%
% Uso: [I] = trapecio_compuesto_iterativo(f, a, b, tol, iterMax)
%
% Argumentos:
% - f: La función a integrar como una cadena de texto.
% - a: El límite inferior de integración.
% - b: El límite superior de integración.
% - tol: La tolerancia de error permitida para la aproximación de la integral.
% - iterMax: El número máximo de iteraciones permitidas.
%
% Salida:
% - I: La aproximación de la integral definida.
%
% Esta función utiliza la función `trapecio_compuesto` para calcular la aproximación de la integral
% mediante el método del trapecio compuesto con un número determinado de subintervalos.

function [I] = trapecio_compuesto_iterativo(f, a, b, tol, iterMax)

  sk = 0;
  sk_1 = 0;

  for k=2:iterMax
    sk_1 = trapecio_compuesto(f, a, b, k);
    error = abs(sk_1 - sk) / abs(sk_1);
    if (error < tol)
      break
    endif
    sk = sk_1;
  endfor

  I = sk_1;

  endfunction
