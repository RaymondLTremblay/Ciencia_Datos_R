# =====================================================================
# instalar_paquetes.R  —  Ciencia de Datos con R (BIOL4026)
# ---------------------------------------------------------------------
# Instala todos los paquetes que usa el libro que NO estén ya instalados.
# Uso: abre este archivo en RStudio y presiona "Source", o en la consola:
#      source("instalar_paquetes.R")
# Es seguro correrlo varias veces: solo instala lo que falte.
# =====================================================================

paquetes_curso <- c(
  # --- Núcleo: tidyverse y datos en español ---
  "tidyverse", "datos", "ggversa",
  "dplyr", "tidyr", "readr", "purrr", "stringr", "forcats",
  "ggplot2", "lubridate", "magrittr",

  # --- Datos de ejemplo ---
  "nycflights13", "babynames", "nasaweather", "fueleconomy", "Lahman",

  # --- Importar / limpiar / tablas ---
  "readxl", "haven", "data.table", "hms", "zoo",
  "gt", "flextable", "knitr", "bookdown", "gridExtra",

  # --- Modelos y estadística ---
  "modelr", "broom", "tidymodels", "MASS", "cumstats", "DescTools",
  "GMCM", "TidyDensity",

  # --- Mapas y visualización ---
  "leaflet", "maps", "RColorBrewer",

  # --- Hex stickers e imágenes ---
  "hexSticker", "showtext", "sysfonts", "magick",

  # --- Nubes de palabras / texto ---
  "wordcloud", "wordcloud2", "tm", "SnowballC", "stopwords",

  # --- Utilidades y datos externos ---
  "pacman", "devtools", "rinat", "cranlogs", "packageRank"
)

# Paquetes que faltan por instalar
faltantes <- setdiff(paquetes_curso, rownames(installed.packages()))

if (length(faltantes) == 0) {
  message("¡Todos los paquetes del libro ya están instalados!")
} else {
  message("Instalando ", length(faltantes), " paquete(s): ",
          paste(faltantes, collapse = ", "))

  fallidos <- character(0)
  for (p in faltantes) {
    ok <- tryCatch({
      install.packages(p, dependencies = TRUE)
      p %in% rownames(installed.packages())
    }, error = function(e) FALSE, warning = function(w) {
      p %in% rownames(installed.packages())
    })
    if (!ok) fallidos <- c(fallidos, p)
  }

  if (length(fallidos) == 0) {
    message("¡Listo! Todos los paquetes se instalaron correctamente.")
  } else {
    message("No se pudieron instalar automáticamente: ",
            paste(fallidos, collapse = ", "),
            "\nInténtalos a mano con install.packages('nombre').")
  }
}

# Reporte final: qué está instalado y qué falta
data.frame(
  paquete   = paquetes_curso,
  instalado = ifelse(paquetes_curso %in% rownames(installed.packages()),
                     "sí", "NO — falta"),
  row.names = NULL
)
