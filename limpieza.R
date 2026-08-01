# ============================================================
# limpieza.R  --  Limpieza del proyecto Ciencia_Datos_R
# ------------------------------------------------------------
# Ejecutar UNA vez en la consola de RStudio, desde la carpeta
# del proyecto (el Rproj abierto):
#
#     source("limpieza.R")
#
# NO borra nada: MUEVE los archivos innecesarios a  _to_delete/
# para que los revises. Si el libro re-renderiza bien, puedes
# borrar esa carpeta tú mismo. Si algo hacía falta, lo sacas
# de _to_delete/ y ya.
# ============================================================

dest <- "_to_delete"
if (!dir.exists(dest)) dir.create(dest)

movidos <- character(0)
mover <- function(x) {
  if (file.exists(x) || dir.exists(x)) {
    ok <- suppressWarnings(file.rename(x, file.path(dest, basename(x))))
    if (isTRUE(ok)) movidos <<- c(movidos, x)
  }
}

# --- 1. Artefactos de compilacion (bookdown los regenera) ---
artefactos <- c(
  "Ciencia Datos con R.Rmd", "Ciencia-Datos-con-R.Rmd", "Ciencia-Datos-con-R.tex",
  "Ciencia-Datos-con-R.log", "Ciencia-Datos-con-R.pdf", "Ciencia_Datos_con_R.log",
  "Rplots.pdf", "render_completo.log", "_book"
)

# --- 2. Datos/documentos que NINGUN capitulo usa (para revision) ---
no_usados <- c(
  "UPRCar_06_22_Enrolled_Student.csv", "cran-mirror",
  "Estudiantes_2024_Ciencia_Datos.csv", "Estudiantes_2024_Ciencia_Datos.numbers",
  "Estudiantes_2024_Ciencia_Datos.xlsx", "Estudiantes2_2024_Ciencia_Datos.csv",
  "Species_O.csv", "Shipwrecks or Sunk ships.csv", "Charles_Darwin_paper.txt",
  "La_dama_degustando_te.txt", "Mi gato.pdf", "nojekyll.webloc",
  "test_knitr.Rmd", "Alice-in-Wonderland.Rmd", "alice_original.txt"
)

for (f in c(artefactos, no_usados)) mover(f)

# --- 3. Copia en conflicto de Dropbox de un capitulo ---
mover("20-Strings (Raymond Tremblay's conflicted copy 2025-11-17).Rmd")

# --- 4. Por patron: dirs temporales de knitr, .Rhistory en conflicto,
#        y los stickers "Meow" viejos (nombres con salto de linea) ---
temp_knitr <- list.dirs(".", recursive = FALSE, full.names = FALSE)
for (d in temp_knitr[grepl("^file", temp_knitr)]) mover(d)

for (f in list.files(".", pattern = "^\\.Rhistory \\(", all.files = TRUE)) mover(f)

for (f in list.files(".", pattern = "^Meow")) mover(f)

# --- 5. Asegurar que .gitignore ignore la basura de aqui en adelante ---
ignore_lines <- c("_to_delete/", "_book/", "file*/", "*.knit.md",
                  "Ciencia_Datos_con_R.log", "Ciencia-Datos-con-R.*",
                  ".RData", ".Rhistory", "*conflicted copy*", "cran-mirror/",
                  ".DS_Store", "Rplots.pdf")
gi <- if (file.exists(".gitignore")) readLines(".gitignore") else character(0)
nuevas <- setdiff(ignore_lines, gi)
if (length(nuevas)) writeLines(c(gi, nuevas), ".gitignore")

# --- Resumen ---
cat("\n==== LIMPIEZA COMPLETADA ====\n")
cat("Movidos a _to_delete/:", length(movidos), "elementos\n")
if (length(movidos)) cat(paste0("  - ", movidos), sep = "\n")
if (length(nuevas)) cat("\n\nAnadidas a .gitignore:", length(nuevas), "lineas\n")
cat("\nRevisa _to_delete/. Re-renderiza el libro; si todo sale bien,",
    "\npuedes borrar la carpeta _to_delete/ cuando quieras.\n")
