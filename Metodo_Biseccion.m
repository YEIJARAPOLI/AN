function result = Metodo_Biseccion(funcion, a, b)

  error = 1;
  mnAnt = 1;
  i = 0;
  result = [-1, -2, -3, -4, -5, -6, -7];

  while((error > (1 * 10.^(-3))) &&  (i < 40))

    mn = (a + b) / 2;
    f_mn = feval(funcion, mn);
    signo = feval(funcion, a) * f_mn;

    if(i ~= 0)
      error = abs((mn - mnAnt) / mn * 100);
    else
      error = 100;
    endif

    newLine = [i, a, b, mn, f_mn, signo, error];
    anterior = result;
    result = [anterior; newLine];
    if (signo < 0)
      b = mn;
    else
      a = mn;
    endif
    mnAnt = mn;
    i++;
  endwhile

  disp(strcat("       i","           a   ","         b   ","         MN   ","        f(Mn)   ","       Signo   ","     Error   "));
 endfunction
