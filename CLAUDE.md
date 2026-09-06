# CLAUDE.md — Ciencia de Datos con R (BIOL4026)

Guidance for Claude (and other assistants) working in this repository.

## What this project is

An **online course book** for **BIOL4026 – Ciencia de Datos con R**, taught by
Raymond L. Tremblay at the Universidad de Puerto Rico en Humacao. It is built
with **bookdown** (`bookdown::gitbook`) and published via GitHub Pages at
https://raymondltremblay.github.io/Ciencia_Datos_R/.

- **Language:** Spanish (Puerto Rico). All prose, headings, and code comments are
  in Spanish. Preserve this — do not translate.
- **Audience:** Undergraduate biology students, many new to programming. Keep
  explanations simple, concrete, and encouraging.
- **Foundation:** Based on *R for Data Science* (Grolemund & Wickham); each
  chapter links the English and Spanish R4DS sections.

## Build system (bookdown — NOT an rmarkdown website)

- Build with `bookdown::render_book()` from the project root. Output goes to
  **`docs/`** (see `_bookdown.yml: output_dir`).
- **Chapter order and inclusion are controlled by `_bookdown.yml`** (the
  `rmd_files:` list). A `.Rmd` NOT listed there is not part of the book — this is
  how scratch files and Dropbox "conflicted copy" files stay out of the build.
- Output format is in `_output.yml` (`bookdown::gitbook`, `css: style.css`).
- There is a sibling, older repo `Ciencia-de-Datos-con-R` (an rmarkdown *website*
  with `_site.yml`). This repo (`Ciencia_Datos_R`, bookdown) is the current one.

## Chapter file conventions (important)

- **Only `index.Rmd` has YAML front matter.** Every other chapter file has NO
  YAML and begins with a single level-1 heading (`# Título`) — bookdown numbers
  chapters automatically from these.
- Chapters use `##`/`###` for sections, and typically open with: the "El tema
  proviene…" source links, a `Fecha de la última revisión` + `Sys.Date()` chunk,
  and a `## Temas:` list.
- **Code chunk labels must be UNIQUE across the whole book** (bookdown merges all
  files). Existing chapters use per-chapter prefixes (e.g. `FT1`, `TFB2`). New
  chapters added here use `PAQ*`, `FUN*`, `ITER*`, `MOD*`.

## Chapters added / maintained by assistant work

- `01-Instalacion-de-paquetes.Rmd` — installs all course packages from CRAN
  (mirrors `instalar_paquetes.R` at the repo root).
- `32-Funciones.Rmd`, `33-Iteracion-purrr.Rmd`, `34-Modelos-modelr.Rmd` —
  foundational programming/modeling chapters. Complementary to (not duplicating)
  `31-tidyverse-avanzado.Rmd` (tidy-eval, tidymodels, nested purrr) and
  `21-Ecuaciones-matematicas.Rmd` (LaTeX).

## Editing conventions

- Fix Spanish spelling/accents (á é í ó ú ñ ü ¿ ¡) and agreement; keep the
  author's warm first-person voice; don't rewrite good prose.
- Do NOT change code logic, function/variable names, string contents, or chunk
  labels. Fix only clear Spanish typos in `#` comments.
- Preserve YAML (index only), `***` separators, headings, URLs, and LaTeX/math.

## Pedagogical callouts (pandoc fenced divs, styled in `style.css`)

- Chapters use fenced-div callouts `::: {.class} … :::`. Classes in use:
  `nota`, `consejo`, `advertencia`, `peligro`, `historia`, `banner-cover`,
  **`funcion`** (added Aug 2026: a teal ⚙️ box explaining what an R function
  does, its key arguments, and how to read its output — 2–4 sentences), and
  **`ejercicio`** (added Sept 2026, see the next section).
- The **`.funcion`** and **`.historia`** callouts were swept across the content
  chapters (03–34) so students get moderate-depth prose on each new function and
  a short note on who developed the ideas/tools. Keep this pattern for new
  chapters: introduce a function with a `.funcion` callout, and add a `.historia`
  callout where a distribution, test, package, or concept has a notable origin.

## Ejercicios en cada capítulo (REGLA VIGENTE desde septiembre 2026)

Problema que esto resuelve: los estudiantes copian y pegan el script de los
ejemplos sin entenderlo, y no aprenden. Desde el capítulo de `mutate`
(`09-Transformacion-mutate.Rmd`, Capítulo 10 del libro) **en adelante, TODO
capítulo lleva ejercicios**. Aplica también a los capítulos anteriores cuando se
revisen.

Reglas, sin excepción:

1. **Varios ejercicios por capítulo**, no uno solo: un ejercicio corto después de
   cada idea o función que se enseña, y al final un reto integrador que combine
   dos o más funciones del capítulo.
2. **Datos distintos a los del ejemplo.** Si el capítulo enseña con `vuelos` o
   con el COVID de PR, los ejercicios usan otro conjunto (por ejemplo `millas`,
   `clima`, `bateadores`, `diamantes` del paquete `datos`). El estudiante no
   puede resolverlo cambiando un nombre de columna en el script copiado.
3. **NUNCA se enseña el script de la solución en el capítulo.** El ejercicio va
   en una caja `::: {.ejercicio} … :::` con: el conjunto de datos, lo que hay que
   lograr, y una línea de verificación ("tu tabla debe tener…", "debe haber
   exactamente un NA…"). Se añade un chunk vacío con
   `# Escribe tu código aquí` y `eval=FALSE`, con etiqueta única
   (`c09-ej1`, `c09-ej2`, …).
4. Al menos una pregunta por ejercicio se contesta **en palabras**, no con
   código: qué significa el resultado, por qué salió un `NA`, cuál es el supuesto.
5. **Las soluciones van en `Soluciones/`**, un archivo por capítulo
   (`Soluciones/09-Soluciones-Transformacion-mutate.Rmd`). Esa carpeta NO se
   lista en `_bookdown.yml`, así que no se publica en el sitio del curso; existe
   en GitHub para el profesor. Cada solución incluye el script y una nota de
   "respuesta esperada" para discutir en clase.
6. Al principio de la sección de ejercicios del capítulo va una caja `.nota` que
   recuerda que hay que entregar script, resultado y explicación en palabras.
7. **La hoja del estudiante va en `Ejercicios/`**, un `.Rmd` independiente con su
   propio YAML, instrucciones, tabla de puntos y un bloque vacío por ejercicio.
   Es lo que se sube a la plataforma de la clase. Esa carpeta tampoco se lista en
   `_bookdown.yml`.
8. **Numeración (ojo, son dos numeraciones distintas).** Las hojas de
   `Ejercicios/` llevan el número del **capítulo del libro**
   (`Ejercicios_Capitulo_13_scripts.Rmd`); los archivos de `Soluciones/` llevan
   el prefijo del **archivo del capítulo** (`12-Soluciones-Scripts.Rmd`). El
   número de capítulo va uno por delante del prefijo del archivo, porque
   `index.Rmd` cuenta como Capítulo 1. La tabla completa de correspondencias está
   en `Ejercicios/README.md`.
9. **Cuántos ejercicios.** Varios, pero no un número fijo: se pone uno por cada
   función o idea **de las que de verdad se usan a menudo**. Un capítulo de
   flujo de trabajo puede llevar cinco; uno de exploración, ocho. Vale más
   cubrir bien lo crítico que llenar el capítulo.

## Estado de los ejercicios (septiembre 2026)

Hechos, con las tres piezas (cajas en el capítulo + `Ejercicios/` + `Soluciones/`):

| Cap. | Archivo | Ejercicios |
|:--|:--|--:|
| 10 | `09-Transformacion-mutate.Rmd` | 8 + bono |
| 11 | `10-Transformacion-rank.Rmd` | 8 + bono |
| 12 | `11-Transformacion-funcion-estadistica.Rmd` | 8 + bono |
| 13 | `12-Scripts.Rmd` | 5 + bono |
| 14 | `35-Errores-comunes.Rmd` | 5 + bono |
| 15 | `13-Analisis-exploratorio.Rmd` | 7 + bono |
| 16 | `14-Pipes.Rmd` | 6 + bono |
| 17 | `15-Tibbles.Rmd` | 6 + bono |
| 18 | `16-Importar-datos.Rmd` | 6 + bono |
| 19 | `17-Datos-ordenados.Rmd` | 6 + bono |
| 20 | `18-Datos-relacionados.Rmd` | 6 + bono |
| 21 | `19-Factores.Rmd` | 6 + bono |
| 22 | `20-Strings.Rmd` | 6 + bono |
| 23 | `21-Ecuaciones-matematicas.Rmd` | 6 + bono |
| 24 | `22-Opciones-de-knitr.Rmd` | 6 + bono |
| 25 | `23-Fechas-horas.Rmd` | 6 + bono |
| 26 | `32-Funciones.Rmd` | 6 + bono |
| 27 | `33-Iteracion-purrr.Rmd` | 6 + bono |
| 28 | `34-Modelos-modelr.Rmd` | 6 + bono |
| 29 | `24-HEX-stickers.Rmd` | 6 + bono |
| 30 | `25-WordClouds.Rmd` | 6 + bono |
| 31 | `31-tidyverse-avanzado.Rmd` | 6 + bono |
| 32 | `26-Leaflet-mapa-interactivo.Rmd` | 6 + bono |

Pendientes: los capítulos 2 a 9, los anteriores a `mutate`.

**Apéndices retirados (sept. 2026).** Los tres apéndices de ejercicios del formato
viejo (`27-Ejercicios-transformacion.Rmd`, `28-Ejercicios-transformacion-2.Rmd` y
`29-Ejercicios-fechas.Rmd`) se movieron a `_archivado/` y se quitaron de
`_bookdown.yml`: duplicaban el material de los ejercicios nuevos y enseñaban las
soluciones. Ver `_archivado/README.md`, que además apunta qué se puede rescatar de
ellos (los datos de VIH del Apéndice C encajarían bien en el Capítulo 25).

**Ojo con la marca `(APPENDIX)`.** La llevaba el archivo 27. Al archivarlo pasó a
`30-COVID_Cummulative.Rmd`, que ahora es el único apéndice del libro. Si algún día
se añade otro apéndice, la marca va en el **primero** de ellos, y solo en uno.
Dentro de un apéndice, los `##` y `###` **también** hay que marcarlos con `{-}`:
el `{.unnumbered}` del título no se hereda, y sin él bookdown les pone un número
de capítulo suelto (salía un "12" en la subsección del apéndice).

Dos capítulos se salen del molde y está bien que lo hagan:

- **Cap. 23 (Ecuaciones)** no enseña funciones de R, así que sus ejercicios no
  llevan bloques `# Escribe tu código aquí`: se entregan como código LaTeX entre
  acentos graves más la fórmula compuesta. Su archivo de soluciones usa
  `bookdown::html_document2` a propósito, para que la numeración de ecuaciones y
  las referencias cruzadas se vean funcionando.
- **Cap. 24 (Opciones de knitr)** se corrige mirando el `.html` del estudiante al
  lado de su `.Rmd`: lo que se evalúa es el efecto de las opciones, no un
  resultado numérico.

Conjuntos de datos usados en los ejercicios, para no repetirlos: `millas` y
`paises` son los caballos de batalla; `diamantes` en el capítulo 14;
`Datos/crimen_pr.csv` (8870 filas, 7 columnas, del gobierno de PR) en el 18, que
tiene nombres de columna intercambiados y 733 faltantes, y por eso sirve muy bien
para enseñar importación.

## Prosa de los capítulos

Varios capítulos eran listas de viñetas con el nombre de las funciones y sin
explicación. Al revisarlos se llenan con prosa al nivel de los capítulos 10 a 12
(alrededor de 1300 palabras por capítulo): un párrafo que explique qué hace cada
función y por qué importa, una caja `.funcion` por función nueva, una caja
`.historia` donde haya un origen que valga la pena contar, y ejemplos que se
puedan correr.

Convención de estilo del autor: **no se usan guiones largos** en la prosa; se
usan comas, dos puntos, punto y coma o paréntesis. Las cajas `.funcion` nuevas
separan el título del resto con dos puntos, no con guion largo. Los capítulos
anteriores todavía tienen guiones largos de una revisión vieja.

## Limpieza del proyecto (sept. 2026)

Hecho:

- Borrados los artefactos regenerables del build: `Ciencia_Datos_con_R_files/` de
  la **raíz** (el intermedio; la copia de `docs/` es la que usa el sitio y se
  queda), `_bookdown_files/` y los `.DS_Store`.
- Resueltas las 4 copias en conflicto de Dropbox, todas dentro de `.Rproj.user/`.
- Las 8 carpetas `file*/` de knitr se movieron a `_to_delete/`: el montaje de
  Dropbox las reporta vacías al listarlas y "no vacías" al borrarlas, así que hay
  que arrastrarlas a la papelera desde el Finder.

Pendiente de decisión (nada de esto se tocó):

- `.git` pesa **249 MB** porque en algún momento se comitearon archivos grandes.
  Adelgazarlo exige reescribir la historia (`git filter-repo`), que es delicado y
  hay que hacerlo con calma y con copia de seguridad.
- `Datos/babynames/` (**138 MB**, 196 archivos del censo de EEUU) y
  `Datos/Vehicle_collision_NY_Kaggle.csv` (**85 MB**): **ningún capítulo los usa**.
  El capítulo de datos relacionados usa el paquete `babynames::`, no esta carpeta.
- `Graficos/` (**57 MB**), de los cuales 43 MB son tres imágenes que no usa ningún
  capítulo: `Brass_cucu1.png`, `Brass_cucu2.png` y `Number_species_vs_Alien.tiff`.
- `nchs_births_2001.csv` (**27 MB**) en la raíz: solo aparece en bloques con
  `eval=FALSE` del capítulo de importar datos.
- `Visualization.Rmd`: está en la raíz pero no en `_bookdown.yml`, así que no
  forma parte del libro.
- `docs/appendix-a.html`, `-b.html`, `-c.html`: quedaron huérfanas al archivar los
  apéndices, pero **no se pueden borrar todavía**: 25 páginas del sitio las
  enlazan. Se limpian **después** del próximo render completo, que además hace
  falta para publicar todo lo de esta sesión.

## Housekeeping notes

- The repo contains Dropbox **"conflicted copy"** files (e.g.
  `20-Strings (… conflicted copy …).Rmd`, several `.Rhistory (… conflicted copy)`)
  that are not in `_bookdown.yml`; they are safe to delete.
- RESOLVED (Aug 2026): `09-Transformacion-mutate.Rmd` deprecated `as.tibble()` →
  `as_tibble()`; `19-Factores.Rmd` `sd_edad = min(...)` → `sd(edad)`. Both fixed.
- RESUELTO (sept. 2026): las cuatro cabeceras de bloque con una etiqueta vieja
  suelta como segundo argumento sin nombre ya están arregladas
  (`16-Importar-datos.Rmd`, `06-Transformacion-funcion-basica.Rmd`,
  `24-HEX-stickers.Rmd` y `26-Leaflet-mapa-interactivo.Rmd`).
- PENDIENTE: `geom_hex()` se usa en `34-Modelos-modelr.Rmd` pero `hexbin` no está
  en `01-Instalacion-de-paquetes.Rmd`.
