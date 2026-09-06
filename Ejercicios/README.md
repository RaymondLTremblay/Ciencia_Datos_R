# Ejercicios (hoja del estudiante)

Esta carpeta contiene la hoja de ejercicios que se sube a la plataforma de la
clase, una por capítulo del libro.

- **No forma parte del libro publicado.** `bookdown` solo construye los archivos
  listados en `rmd_files:` dentro de `_bookdown.yml`, y ninguno de estos archivos
  está en esa lista.
- Cada hoja es un `.Rmd` independiente, con su propio encabezado YAML, las
  instrucciones, la tabla de puntos y un bloque vacío por ejercicio. El
  estudiante la completa y entrega el `.Rmd` y el `.html`.
- Los mismos ejercicios aparecen dentro del capítulo, en cajas
  `::: {.ejercicio}` y **sin el script de solución**.
- Las respuestas de referencia están en `Soluciones/`.

## Convención de nombres

Las hojas llevan el número del **capítulo del libro**:
`Ejercicios_Capitulo_13_scripts.Rmd` es el Capítulo 13.

Las soluciones llevan el número del **archivo del capítulo**:
`Soluciones/12-Soluciones-Scripts.Rmd` corresponde a `12-Scripts.Rmd`, que es el
Capítulo 13 del libro. Para los primeros capítulos el número va uno por delante
del prefijo del archivo (porque `index.Rmd` cuenta como Capítulo 1), pero eso
**deja de cumplirse** a partir del Capítulo 14: ver la nota al final de esta
página.

| Capítulo | Archivo del capítulo | Hoja del estudiante | Soluciones |
|:--|:--|:--|:--|
| 10 | `09-Transformacion-mutate.Rmd` | `Ejercicios_Capitulo_10_mutate.Rmd` | `09-Soluciones-Transformacion-mutate.Rmd` |
| 11 | `10-Transformacion-rank.Rmd` | `Ejercicios_Capitulo_11_rangos.Rmd` | `10-Soluciones-Transformacion-rank.Rmd` |
| 12 | `11-Transformacion-funcion-estadistica.Rmd` | `Ejercicios_Capitulo_12_indices.Rmd` | `11-Soluciones-Transformacion-funcion-estadistica.Rmd` |
| 13 | `12-Scripts.Rmd` | `Ejercicios_Capitulo_13_scripts.Rmd` | `12-Soluciones-Scripts.Rmd` |
| 14 | `35-Errores-comunes.Rmd` | `Ejercicios_Capitulo_14_errores.Rmd` | `35-Soluciones-Errores-comunes.Rmd` |
| 15 | `13-Analisis-exploratorio.Rmd` | `Ejercicios_Capitulo_15_exploratorio.Rmd` | `13-Soluciones-Analisis-exploratorio.Rmd` |
| 16 | `14-Pipes.Rmd` | `Ejercicios_Capitulo_16_pipes.Rmd` | `14-Soluciones-Pipes.Rmd` |
| 17 | `15-Tibbles.Rmd` | `Ejercicios_Capitulo_17_tibbles.Rmd` | `15-Soluciones-Tibbles.Rmd` |
| 18 | `16-Importar-datos.Rmd` | `Ejercicios_Capitulo_18_importar.Rmd` | `16-Soluciones-Importar-datos.Rmd` |
| 19 | `17-Datos-ordenados.Rmd` | `Ejercicios_Capitulo_19_datos-ordenados.Rmd` | `17-Soluciones-Datos-ordenados.Rmd` |
| 20 | `18-Datos-relacionados.Rmd` | `Ejercicios_Capitulo_20_datos-relacionados.Rmd` | `18-Soluciones-Datos-relacionados.Rmd` |
| 21 | `19-Factores.Rmd` | `Ejercicios_Capitulo_21_factores.Rmd` | `19-Soluciones-Factores.Rmd` |
| 22 | `20-Strings.Rmd` | `Ejercicios_Capitulo_22_strings.Rmd` | `20-Soluciones-Strings.Rmd` |
| 23 | `21-Ecuaciones-matematicas.Rmd` | `Ejercicios_Capitulo_23_ecuaciones.Rmd` | `21-Soluciones-Ecuaciones-matematicas.Rmd` |
| 24 | `22-Opciones-de-knitr.Rmd` | `Ejercicios_Capitulo_24_knitr.Rmd` | `22-Soluciones-Opciones-de-knitr.Rmd` |
| 25 | `23-Fechas-horas.Rmd` | `Ejercicios_Capitulo_25_fechas.Rmd` | `23-Soluciones-Fechas-horas.Rmd` |
| 26 | `32-Funciones.Rmd` | `Ejercicios_Capitulo_26_funciones.Rmd` | `32-Soluciones-Funciones.Rmd` |
| 27 | `33-Iteracion-purrr.Rmd` | `Ejercicios_Capitulo_27_iteracion.Rmd` | `33-Soluciones-Iteracion-purrr.Rmd` |
| 28 | `34-Modelos-modelr.Rmd` | `Ejercicios_Capitulo_28_modelos.Rmd` | `34-Soluciones-Modelos-modelr.Rmd` |
| 29 | `24-HEX-stickers.Rmd` | `Ejercicios_Capitulo_29_hex.Rmd` | `24-Soluciones-HEX-stickers.Rmd` |
| 30 | `25-WordClouds.Rmd` | `Ejercicios_Capitulo_30_wordclouds.Rmd` | `25-Soluciones-WordClouds.Rmd` |
| 31 | `31-tidyverse-avanzado.Rmd` | `Ejercicios_Capitulo_31_avanzado.Rmd` | `31-Soluciones-tidyverse-avanzado.Rmd` |
| 32 | `26-Leaflet-mapa-interactivo.Rmd` | `Ejercicios_Capitulo_32_leaflet.Rmd` | `26-Soluciones-Leaflet.Rmd` |

Ojo: los prefijos de archivo **no** van en el orden del libro. `35-Errores-comunes.Rmd`
es el Capítulo 14 porque en `_bookdown.yml` está colocado justo después de
`12-Scripts.Rmd`, y `32-Funciones.Rmd` y `33-Iteracion-purrr.Rmd` son los
Capítulos 26 y 27 porque están colocados después de `23-Fechas-horas.Rmd`. El
orden de verdad es el de la lista `rmd_files:` de `_bookdown.yml`, y es el único
sitio donde mirarlo.
