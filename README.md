# PellEquationSolver
Funzioni per trovare lo sviluppo in frazione continua semplice delle radici quadrate di numeri naturali non quadrati perfetti e per risolvere le equazioni di Pell e le equazioni di Pell generalizzate

## Come utilizzare le funzioni
Tutte le funzioni sono contenute nel file `pell.gp`.<br>
Per utilizzarle, aprire la shell di **PARI/GP** e importare le funzioni con il comando:
```
read(percorso);
```
Dove `percorso` va sostituito con il percorso completo del file `pell.gp`.

## Manuale delle funzioni
```
sviluppa_radice(d)
```
**Precondizioni:** `d` deve essere un numero naturale che non sia un quadrato perfetto.<br>
**Postcondizioni:** Restituisce lo sviluppo in frazione continua semplice della radice quadrata di `d` nella forma `[a0, [a1, a2, ..., a2, a1, 2*a0]]`.

```
trova_fondamentale(d)
```
**Precondizioni:** `d` deve essere un numero naturale che non sia un quadrato perfetto.<br>
**Postcondizioni:** restituisce la soluzione fondamentale dell'equazione di Pell `x^2 - d * y^2 = 1` nella forma `[x, y]`.

```
risolvi_generalizzata(d, m)
```
**Precondizioni:** `d` deve essere un numero naturale che non sia un quadrato perfetto, `m` deve essere un numero intero diverso da 0 e diverso da 1.<br>
**Postcondizioni:** restituisce la soluzione fondamentale dell'equazione di Pell `x^2 - d * y^2 = 1` e i rappresentanti delle orbite delle soluzioni dell'equazione di Pell generalizzata `x^2 - d * y^2 = m` nella forma `[[x, y], [[r1x, r1y], [r2x, r2y], ..., [rix, riy]]]`.<br>
**Nota:** il tempo richiesto da questa funzione per trovare i risultati di certe equazioni è molto superiore all'età dell'Universo. In tali casi conviene trovare dei metodi migliori per escludere alcuni valori dallo spazio di ricerca delle soluzioni.
