\\ Pre: d numero naturale non quadrato perfetto
\\ Post: restituisce la frazione continua di radice di d nella forma [a0, [a1, ..., a1, 2 a0]]
sviluppa_radice(d) = 
{
  my(P, Q, a0, a, L);

  P = 0;
  Q = 1;
  a0 = floor( sqrt(d) );
  L = List();

  a = a0;

  while(a != 2 * a0,
    P = a * Q - P;
    Q = (d - P^2) / Q;
    a = floor( (P + sqrt(d)) / Q );
    listput(L, a);
  );

  return( [a0, Vec(L)] );
}

\\ Pre: d numero naturale non quadrato perfetto
\\ Post: restituisce la soluzione fondamentale di x^2 - d y^2 = 1 nella forma [p, q]
trova_fondamentale(d) = 
{
  my(v, k, n, i, p, q);

  v = sviluppa_radice(d);
  n = #(v[2]);

  if(n % 2 == 0,
    \\ se n e' pari
    k = n - 1;
    v = concat( [v[1]], v[2] );
    ,
    \\ se n e' dispari
    k = 2 * n - 1;
    v = concat( [v[1]], concat( v[2], v[2] ) );
  );

  p = [v[1], v[1] * v[2] + 1, 0];
  q = [1, v[2], 0];

  for(i = 2, k,
    p[3] = v[i + 1] * p[2] + p[1];
    q[3] = v[i + 1] * q[2] + q[1];

    p[1] = p[2];
    q[1] = q[2];

    p[2] = p[3];
    q[2] = q[3];
  );

  return( [p[2], q[2]] );
}

\\ Pre: n numero naturale
\\ Post: restituisce 1 (true) se n e' un quadrato perfetto, 0 (false) altrimenti
quadrato_perfetto(n) = 
{
  return( n == floor(sqrt(n))^2 );
}

\\ Pre: d numero naturale non quadrato perfetto, m numero intero diverso da zero e da uno
\\ Post: restituisce l'insieme R dei rappresentanti delle orbite delle soluzioni e la soluzione fondamentale dell'equazione di Pell associata. nella forma [[p, q], R]
risolvi_generalizzata(d, m) = 
{
  my(epsilon, e, x, y, y_lim, R);

  epsilon = trova_fondamentale(d);
  e = epsilon[1] + epsilon[2] * sqrt(d);

  R = List();

  if(m > 0,
    \\ se m e' positivo
    if(quadrato_perfetto(m),
      listput(R, [floor(sqrt(m)), 0]);
      listput(R, [- floor(sqrt(m)), 0]);
    );
    ,
    \\ se m e' negativo
    if(quadrato_perfetto(- m / d),
      listput(R, [0, floor(sqrt(- m / d))]);
      listput(R, [0, - floor(sqrt(- m / d))]);
    );
  );

  y_lim = floor( sqrt(abs(m)) * (1 + sqrt(e)) / (2 * sqrt(d)) );

  for(y = 1, y_lim,
    if(m + d * y^2 > 0 && quadrato_perfetto(m + d * y^2),
      x = floor(sqrt(m + d * y^2));
      listput(R, [x, y]);
      listput(R, [-x, y]);
      listput(R, [x, -y]);
      listput(R, [-x, -y]);
    );
  );

  R = Set(R);

  return( [epsilon, R] );
}
