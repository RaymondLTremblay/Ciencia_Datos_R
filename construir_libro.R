# ============================================================
# construir_libro.R  --  Construir el libro y limpiar temporales
# ------------------------------------------------------------
# Usa esto EN LUGAR del boton "Build" para que la raiz quede
# limpia despues de cada compilacion:
#
#     source("construir_libro.R")
#
# Construye los tres formatos (HTML + PDF + ePub) y luego borra
# las carpetas temporales vacias (file...) y los archivos
# auxiliares de LaTeX que el render deja en la raiz.
# ============================================================

# 1. Construir el libro completo (HTML gitbook + PDF + ePub)
bookdown::render_book("index.Rmd", output_format = "all")

# 2. Borrar las carpetas temporales vacias 'file<hex>' que dejan
#    pandoc/knitr durante los pases de PDF y ePub
tmp_dirs <- list.files(pattern = "^file[0-9a-f]+$")
tmp_dirs <- tmp_dirs[dir.exists(tmp_dirs)]
if (length(tmp_dirs)) unlink(tmp_dirs, recursive = TRUE)

# 3. Borrar los auxiliares de LaTeX (evitan el error \@writefile)
aux <- list.files(
  pattern = "^Ciencia_Datos_con_R\\.(tex|aux|toc|lof|lot|out|log|idx|ind|ilg)$"
)
if (length(aux)) unlink(aux)

message("\n== Libro construido. Carpetas temporales borradas: ",
        length(tmp_dirs), ". Salida en docs/ ==")
