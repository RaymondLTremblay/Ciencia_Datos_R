# ============================================================
# construir_libro.R  --  Construir el libro y limpiar temporales
# ------------------------------------------------------------
# Usa esto EN LUGAR del boton "Build":
#
#     source("construir_libro.R")
#
# El libro se construye SOLO en HTML (gitbook). La salida va a docs/.
#
# El PDF y el ePub se quitaron en septiembre de 2026: no se usaban, y el paso
# de LaTeX fallaba una y otra vez porque Dropbox truncaba los auxiliares
# mientras xelatex los escribia, con errores del tipo
#
#     ! File ended while scanning use of \@writefile
#     ! File ended while scanning use of \@newl@bel
#
# Sin PDF ni ePub, esos errores ya no pueden ocurrir.
#
# La limpieza se conserva por dos razones: las carpetas temporales 'file<hex>'
# las siguen dejando pandoc y knitr, y puede quedar algun auxiliar de LaTeX de
# antes del cambio. Se limpia al empezar y, con on.exit(), tambien al salir
# aunque el render falle.
# ============================================================

limpiar_temporales <- function() {
  # carpetas temporales vacias 'file<hex>' que dejan pandoc/knitr
  tmp_dirs <- list.files(pattern = "^file[0-9a-f]+$")
  tmp_dirs <- tmp_dirs[dir.exists(tmp_dirs)]
  if (length(tmp_dirs)) unlink(tmp_dirs, recursive = TRUE)

  # restos de LaTeX y el .Rmd fusionado que deja bookdown
  aux <- list.files(
    pattern = paste0(
      "^Ciencia_Datos_con_R\\.",
      "(tex|aux|toc|lof|lot|out|log|idx|ind|ilg|Rmd|knit\\.md|utf8\\.md)$"
    )
  )
  if (length(aux)) unlink(aux)

  invisible(length(tmp_dirs) + length(aux))
}

# Los iconos del sitio (favicon) no los copia bookdown, porque se enlazan desde
# favicon.html y no desde el texto de los capitulos. Se copian a mano a docs/
# despues de cada render, si no el navegador los pide y recibe un 404.
copiar_iconos <- function() {
  iconos <- c("favicon.svg", "favicon.ico", "favicon-16x16.png",
              "favicon-32x32.png", "apple-touch-icon.png")
  iconos <- iconos[file.exists(iconos)]
  if (length(iconos)) file.copy(iconos, "docs", overwrite = TRUE)
  invisible(length(iconos))
}

# 1. Limpiar antes de empezar
n_antes <- limpiar_temporales()
message("== Limpieza previa: ", n_antes, " archivo(s) o carpeta(s) ==")

# 2. Limpiar tambien al salir, falle o no el render
on.exit(limpiar_temporales(), add = TRUE)

# 3. Construir el libro en HTML
bookdown::render_book("index.Rmd", output_format = "bookdown::gitbook")

# 4. Copiar los iconos del sitio a docs/
n_iconos <- copiar_iconos()
message("== Iconos copiados a docs/: ", n_iconos, " ==")

message("\n== Libro construido en HTML. Salida en docs/ ==")
