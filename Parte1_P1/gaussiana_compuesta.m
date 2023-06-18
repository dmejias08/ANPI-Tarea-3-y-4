% Esta función realiza la integración por el método de cuadratura gaussiana compuesta,
% utilizando la fórmula de la cuadratura gaussiana para calcular la integral definida de una función en un intervalo dado.
% Toma como entrada la función a integrar `f`, los límites de integración `a` y `b`,
% el número de puntos `N` y el orden de cuadratura `M`.
% Devuelve una aproximación de la integral definida.
%
% Uso: [I] = gaussiana_compuesta(f, a, b, M, N)
%
% Argumentos:
% - f: La función a integrar como una cadena de texto.
% - a: El límite inferior de integración.
% - b: El límite superior de integración.
% - M: El orden de la cuadratura gaussiana compuesta.
% - N: El número de puntos para la cuadratura gaussiana compuesta.
%
% Salida:
% - I: La aproximación de la integral definida.
%
% Esta función utiliza la función `cuadratura_gaussiana` para realizar la cuadratura gaussiana en cada subintervalo,
% utilizando los pesos y nodos de cuadratura adecuados para el orden `M`.

function [I] = gaussiana_compuesta(f,a,b,M,N)

  x = conjunto_soporte(a,b,N);
  I = 0;

  for i=1:N-1
    I = I + cuadratura_gaussiana(f,x(i),x(i+1),M);
  end
  disp(I);

end

function [I] = cuadratura_gaussiana(f, a, b, M)

  func =  str2func(['@(x)' f]);
  g=@(x) ((b-a)/2)*func((b-a)/2*x+(b+a)/2);
  [x,w] = pesos_x_gauss(M);

  I = 0;

  for i=1:M
    I = I+w(i)*g(x(i));
  end

endfunction

function [x,w] = pesos_x_gauss(M)
  switch (M)
  case 2
    x=[-0.5773502691896257 0.5773502691896257];
    w=[1 1];
  case 3
    x=[0  -0.7745966692414834 0.7745966692414834];
    w=[0.8888888888888888 0.5555555555555556 0.5555555555555556];
  case 4
    x=[-0.3399810435848563 0.3399810435848563 -0.8611363115940526 0.8611363115940526];
    w=[0.6521451548625461 0.6521451548625461 0.3478548451374538 0.3478548451374538];
  case 5
    x=[0,-0.5384693101056831,0.5384693101056831,-0.9061798459386640,0.9061798459386640];
    w=[0.56888888888,0.4786286704993665,0.4786286704993665, 0.2369268850561891,0.2369268850561891];
  case 6
    x=[0.6612093864662645,-0.6612093864662645,-0.2386191860831969,0.2386191860831969,-0.9324695142031521,0.9324695142031521];
    w=[0.3607615730481386,0.3607615730481386,0.4679139345726910,0.4679139345726910,0.1713244923791704,0.1713244923791704];
  case 7
    x=[0,0.4058451513773972,-0.4058451513773972,-0.7415311855993945,0.7415311855993945,-0.9491079123427585,0.9491079123427585 ];
    w=[0.4179591836734694,0.3818300505051189,0.3818300505051189,0.2797053914892766,0.2797053914892766,0.1294849661688697,0.1294849661688697];
  case 8
    w=[0.3626837833783620,0.3626837833783620,0.3137066458778873,0.3137066458778873,0.2223810344533745,0.2223810344533745,0.1012285362903763,0.1012285362903763];
    x=[-0.1834346424956498,0.1834346424956498,-0.5255324099163290,0.5255324099163290,-0.7966664774136267,0.7966664774136267,-0.9602898564975363,0.9602898564975363];
  case 9
    x=[0,-0.8360311073266358,0.8360311073266358,-0.9681602395076261,0.9681602395076261,-0.3242534234038089,0.3242534234038089,-0.6133714327005904,0.6133714327005904];
    w=[0.1806481606948574,0.0812743883615744,0.0812743883615744,0.3123470770400029,0.3123470770400029,0.2606106964029354,0.2606106964029354];
  case 10
    x=[-0.1488743389816312,0.1488743389816312,-0.4333953941292472,0.4333953941292472,-0.6794095682990244,0.6794095682990244,-0.8650633666889845,0.8650633666889845,-0.9739065285171717,0.9739065285171717];
    w=[0.2955242247147529,0.2955242247147529,0.2692667193099963,0.2692667193099963,0.2190863625159820,0.2190863625159820,0.1494513491505806,0.1494513491505806,0.0666713443086881,0.0666713443086881];
  endswitch
end

function [x] = conjunto_soporte(a,b,N)

  x = zeros(N,1);
  h = (b - a) / (N-1);
  for j=0:N-1
    x(j+1) = a + h * j;
  endfor

  endfunction