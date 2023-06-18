pkg load symbolic

function R = romberg(f, a, b, n)
% Aproximación de la integral utilizando el método de Romberg.
%
%   R = romberg(f, a, b, n) calcula la integral de la función f en el intervalo [a, b]
%   utilizando el método de Romberg con n iteraciones.
%
%   Argumentos de entrada:
%   - f: Función a integrar. Debe ser una función simbólica
%   - a: Límite inferior del intervalo de integración.
%   - b: Límite superior del intervalo de integración.
%   - n: Número de iteraciones del método de Romberg.
%
%   Argumentos de salida:
%   - R: Matriz de dos filas, con n columnas.
%       Aproximación de la integral de f en el intervalo [a, b] es el valor R(2,n).

    R = zeros(2, n);
    f_sym = sym(f);
    func = matlabFunction(f_sym);
    h = b - a;
    R(1, 1) = (h / 2) * (func(a) + func(b));

    for i = 2:n
       % Regla del trapecio
        h = h / 2;
        sum_term = 0;

        for k = 1:2^(i-2)
            sum_term = sum_term + func(a + (k - 0.5) * h);
        end

        R(2, 1) = 0.5 * R(1, 1) + h * sum_term;

        % Extrapolacion de Richardson
        for j = 2:i
            R(2, j) = R(2, j-1) + (R(2, j-1) - R(1, j-1)) / ((4^(j-1)) - 1);
        end

        % Se copian los valores para la siguiente iteracion
        for j = 1:i
            R(1, j) = R(2,j);
        end
    end
end

