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

## Housekeeping notes

- The repo contains Dropbox **"conflicted copy"** files (e.g.
  `20-Strings (… conflicted copy …).Rmd`, several `.Rhistory (… conflicted copy)`)
  that are not in `_bookdown.yml`; they are safe to delete.
- Known non-blocking code items still open: `09-Transformacion-mutate.Rmd` uses
  deprecated `as.tibble()` (should be `as_tibble()`); `19-Factores.Rmd` has
  `sd_edad = min(horas_tv, …)` (variable named "sd" but computes a min).
