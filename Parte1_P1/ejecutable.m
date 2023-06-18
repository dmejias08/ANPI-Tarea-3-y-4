f = 'log(asin(x)) / log(x)';
a = 0.1;
b = 0.9;
N = 20;
M = 5;
tol = 10^-6;
iterMax = 2500;

% Prueba de la función de simpson compuesto
I_simpson_compuesto = simpson_compuesto(f, a, b, N);
disp('Resultado de la función simpson_compuesto:');
disp(I_simpson_compuesto);
pause(1); % Delay de 1 segundo

% Prueba de la función de trapecio compuesto
I_trapecio_compuesto = trapecio_compuesto(f, a, b, N);
disp('Resultado de la función trapecio_compuesto:');
disp(I_trapecio_compuesto);
pause(1); % Delay de 1 segundo

% Prueba de la función de gaussiana compuesta
I_gaussiana_compuesta = gaussiana_compuesta(f, a, b, M, N);
disp('Resultado de la función gaussiana_compuesta:');
disp(I_gaussiana_compuesta);
pause(1); % Delay de 1 segundo

% Prueba de la función de simpson compuesto iterativo
I_simpson_compuesto_iterativo = simpson_compuesto_iterativo(f, a, b, tol, iterMax);
disp('Resultado de la función simpson_compuesto_iterativo:');
disp(I_simpson_compuesto_iterativo);
pause(1); % Delay de 1 segundo

% Prueba de la función de trapecio compuesto iterativo
I_trapecio_compuesto_iterativo = trapecio_compuesto_iterativo(f, a, b, tol, iterMax);
disp('Resultado de la función trapecio_compuesto_iterativo:');
disp(I_trapecio_compuesto_iterativo);
pause(1); % Delay de 1 segundo

% Prueba de la función de cuadratura gaussiana compuesta iterativa
I_gaussiana_compuesta_iterativa = gaussiana_compuesta_iterativa(f, a, b, M, tol, iterMax);
disp('Resultado de la función gaussiana_compuesta_iterativa:');
disp(I_gaussiana_compuesta_iterativa);
pause(1); % Delay de 1 segundo
