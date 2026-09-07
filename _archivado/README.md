# Material archivado

Esta carpeta guarda capítulos que **ya no forman parte del libro**. No están
listados en `_bookdown.yml`, así que no se compilan ni aparecen en el sitio
publicado. Se conservan aquí por si hace falta recuperar algún ejercicio o
consultar cómo estaba hecho antes.

## Archivado en septiembre de 2026

Los tres apéndices de ejercicios, retirados al terminar la ronda de ejercicios por
capítulo (regla vigente desde septiembre de 2026, documentada en `CLAUDE.md`).

| Archivo | Era | Contenido |
|:--|:--|:--|
| `27-Ejercicios-transformacion.Rmd` | Apéndice A | Ejercicios de transformación con `bateadores` (Lahman) |
| `28-Ejercicios-transformacion-2.Rmd` | Apéndice B | Ejercicios de transformación 2 con los datos de COVID de PR |
| `29-Ejercicios-fechas.Rmd` | Apéndice C | Ejercicios de fechas con los datos de VIH |

**Por qué se retiraron.** Desde septiembre de 2026 cada capítulo del libro lleva
sus propios ejercicios, en cajas `::: {.ejercicio}`, con su hoja de entrega en
`Ejercicios/` y sus respuestas en `Soluciones/`. Estos tres apéndices cubrían el
mismo terreno con el formato anterior (los ejercicios y sus soluciones juntos, a la
vista), así que duplicaban material y contradecían la regla de no enseñar la
solución.

**Qué se puede rescatar de aquí.** Los conjuntos de datos y las preguntas siguen
siendo buenos, y no se han reutilizado en los capítulos nuevos:

- `bateadores` (estadísticas de béisbol) del Apéndice A;
- los datos de COVID de Puerto Rico del Apéndice B;
- los datos de VIH (`Datos/HIV.csv`) del Apéndice C, con cálculos de edad al
  diagnóstico y tiempo entre diagnóstico y muerte, que encajarían muy bien en el
  Capítulo 25, de fechas y horas.

## Nota técnica

El archivo `27-Ejercicios-transformacion.Rmd` era el que llevaba la marca
`# (APPENDIX)` que le dice a bookdown dónde empiezan los apéndices. Al archivarlo,
esa marca se trasladó a `30-COVID_Cummulative.Rmd`, que ahora es el único apéndice
del libro. Si algún día se recuperan estos archivos, hay que quitar la marca del
30 para que no quede duplicada.

## `preamble.tex` (septiembre 2026)

Se archivó al quitar el PDF y el ePub de `_output.yml`. Era el
`includes: in_header:` del formato `bookdown::pdf_book` y contenía una sola
línea, `\usepackage{booktabs}`.

Se quitaron los dos formatos porque no se usaban y porque el paso de LaTeX
fallaba de forma repetida: el proyecto vive dentro de Dropbox, que truncaba
`Ciencia_Datos_con_R.aux` mientras xelatex lo escribía, y en el pase siguiente
xelatex leía el archivo cortado a la mitad de un comando
(`! File ended while scanning use of \@writefile`). El libro se construye ahora
solo en HTML, y ese error ya no puede ocurrir.

Para restaurar el PDF: devolver este archivo a la raíz del proyecto, volver a
añadir el bloque `bookdown::pdf_book` a `_output.yml` con
`includes: in_header: preamble.tex`, devolver `download: ["pdf"]` a la
configuración de gitbook, y cambiar el `output_format` de `construir_libro.R`.
Antes de hacerlo, pausar la sincronización de Dropbox durante la construcción.
