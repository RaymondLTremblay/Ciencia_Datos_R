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

## Housekeeping notes

- The repo contains Dropbox **"conflicted copy"** files (e.g.
  `20-Strings (… conflicted copy …).Rmd`, several `.Rhistory (… conflicted copy)`)
  that are not in `_bookdown.yml`; they are safe to delete.
- RESOLVED (Aug 2026): `09-Transformacion-mutate.Rmd` deprecated `as.tibble()` →
  `as_tibble()`; `19-Factores.Rmd` `sd_edad = min(...)` → `sd(edad)`. Both fixed.
