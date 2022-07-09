
function Metodo_Falsa_Posicion(funcion, a, b, tipoReturnResult)
  error = 1;
  fMn = 0;
  mnAnterior = 1;
  i = 0;
  result = [-1, -2, -3, -4, -5, -6, -7];

  while((error > (1 * 10.^(-3))) &&  (i < 50))
    mn = ((a * feval(funcion,b)) - (b * feval(funcion,a)))/(feval(funcion,b) - feval(funcion,a));
    fMn = feval(funcion, mn);
    signo = feval(funcion, a) * fMn;

    if(i ~= 0)
      error = abs((mn - mnAnterior) / mn * 100);
    else
      error = 100;
    endif

    if(strncmp(tipoReturnResult,"GRAFICA", 10) || strncmp(tipoReturnResult,"ALL", 10))
      newLine = [i, a, b, mn, fMn, signo, error];
    endif

    antes = result;
    result = [antes; newLine];

    if (signo < 0)
      b = mn;
    else
      a = mn;
    endif

    mnAnterior = mn;
    i++;

  endwhile

  if(strncmp(tipoReturnResult, "GRAFICA", 10) || strncmp(tipoReturnResult, "ALL", 10))
    disp(strcat("       i","           a   ","         b   ","         MN   ","        f(Mn)   ","       Signo   ","     Error   "));
  endif

  result

  if(strncmp(tipoReturnResult, "RAIZ MENOR", 10) || strncmp(tipoReturnResult, "ALL", 10))
    disp ("El valor de la raíz con menor error es: ");
    disp("valor: " + fMn);
    disp("% error: " + error);
  endif


 endfunction
