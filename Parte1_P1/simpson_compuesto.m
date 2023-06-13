% Esta función realiza la integración por el método de Simpson compuesto.
% Toma como entrada la función a integrar `f`, los límites de integración `a` y `b`,
% y el número de puntos del conjunto soporte `N`. Devuelve una aproximación de la integral definida.
%
% Uso: [I] = simpson_compuesto(f, a, b, N)
%
% Argumentos:
% - f: La función a integrar como una cadena de texto.
% - a: El límite inferior de integración.
% - b: El límite superior de integración.
% - N: El número de puntos del conjunto soporte para la integración compuesta.
%
% Salida:
% - I: La aproximación de la integral definida.
%
% La función `simpson_compuesto` utiliza las siguientes funciones auxiliares:
%
% - simpson: Calcula la aproximación de la integral de una función utilizando el método de Simpson.
% - conjunto_soporte: Genera un conjunto de puntos de soporte para la integración compuesta.

function [I] = simpson_compuesto(f, a, b, N)

  x = conjunto_soporte(a,b,N);
  I = 0;
  for j=1:N-1
    I = I + simpson(f,x(j),x(j+1));
  endfor
endfunction

function [I] = simpson(f, a, b)

  func =  str2func(['@(x)' f]);
  x1 = (a + b) / 2;
  I = ((b-a) / 6) * (func(a) + 4 * func(x1) + func(b));

endfunction

function [x] = conjunto_soporte(a,b,N)

  x = zeros(N,1);
  h = (b - a) / (N-1);
  for j=0:N-1
    x(j+1) = a + h * j;
  endfor

  endfunction
