# ============================================================
# auditar_avisos.R
# ------------------------------------------------------------
# Genera una lista de TODOS los avisos (warnings) y mensajes que
# ocurren al construir el libro, AUNQUE los capitulos los tengan
# apagados con  warning = FALSE / message = FALSE.
#
# No cambia el libro: los avisos NO se meten en el HTML, solo se
# guardan aparte para que los revises.
#
# Uso (desde la carpeta del proyecto):
#   - En la consola de RStudio:   source("auditar_avisos.R")
#   - O en la terminal:           Rscript auditar_avisos.R
#
# Al terminar deja dos archivos en la carpeta del proyecto:
#   avisos_libro.txt      -> lista limpia, etiquetada por chunk
#   render_completo.log   -> toda la salida de consola (pandoc,
#                            LaTeX, etc.) por si algo se escapa
# ============================================================

# 1. Empezar con un archivo de avisos limpio ------------------
archivo_avisos <- "avisos_libro.txt"
if (file.exists(archivo_avisos)) file.remove(archivo_avisos)

# 2. Forzar que se CAPTUREN warnings y mensajes ---------------
#    opts_hooks corre DESPUES de las opciones de cada chunk, asi
#    que gana sobre  warning = FALSE  sin tener que editar los 36
#    capitulos.
knitr::opts_hooks$set(
  warning = function(options) { options$warning <- TRUE; options },
  message = function(options) { options$message <- TRUE; options }
)

# 3. Enganches que ESCRIBEN cada aviso al archivo y devuelven ""
#    (asi no aparecen en el libro).
knitr::knit_hooks$set(
  warning = function(x, options) {
    cat(sprintf("WARNING  [%s]  %s\n", options$label, trimws(x)),
        file = archivo_avisos, append = TRUE)
    ""
  },
  message = function(x, options) {
    cat(sprintf("MENSAJE  [%s]  %s\n", options$label, trimws(x)),
        file = archivo_avisos, append = TRUE)
    ""
  }
)

# 4. Construir el libro (con HTML basta para el audit) y guardar
#    TODA la salida de consola por si hay avisos fuera de chunks.
con <- file("render_completo.log", open = "wt")
sink(con, type = "output")
sink(con, type = "message")

resultado <- tryCatch(
  bookdown::render_book("index.Rmd", "bookdown::gitbook", quiet = FALSE),
  error = function(e) e
)

sink(type = "message")
sink(type = "output")
close(con)

# 5. Resumen en pantalla --------------------------------------
if (file.exists(archivo_avisos)) {
  avisos <- readLines(archivo_avisos)
  n_warn <- sum(startsWith(avisos, "WARNING"))
  n_msg  <- sum(startsWith(avisos, "MENSAJE"))
  message(sprintf(
    "\n== Audit terminado: %d warnings y %d mensajes. Revisa '%s'. ==",
    n_warn, n_msg, archivo_avisos))

  # Cuenta cuantos avisos por capitulo/chunk, de mayor a menor
  etiquetas <- sub("^\\w+\\s+\\[([^]]*)\\].*", "\\1", avisos)
  message("\nAvisos por chunk (los mas ruidosos primero):")
  print(sort(table(etiquetas), decreasing = TRUE))
} else {
  message("\n== No se capturo ningun aviso. Todo limpio. ==")
}

if (inherits(resultado, "error")) {
  message("\nOJO: el render se DETUVO con un error:")
  message(conditionMessage(resultado))
}
