# ============================================================
# reorganizar.R  --  Limpiar los sobrantes de la raiz
# ------------------------------------------------------------
# Las imagenes de entrada ya estan en  img/  y  HIV.csv ya esta
# en  Datos/ . Este script solo MANDA a  _to_delete/  las copias
# viejas que quedaron en la raiz y las imagenes que no se usan.
# (Nada se borra de verdad; todo va a _to_delete/.)
#
# OPCIONAL: el libro ya compila sin correr esto. Ejecutalo solo
# si quieres la raiz completamente limpia:
#
#     source("reorganizar.R")
#
# NOTA: nchs_births_2001.csv (27 MB) se queda en la raiz a
# proposito; el capitulo 16 lo lee desde ahi.
# ============================================================

dest <- "_to_delete"
if (!dir.exists(dest)) dir.create(dest)

movidos <- character(0)
a_basura <- function(x) {
  if (file.exists(x)) {
    ok <- suppressWarnings(file.rename(x, file.path(dest, basename(x))))
    if (isTRUE(ok)) movidos <<- c(movidos, x)
  }
}

# Copias viejas en la raiz (ya viven en img/ o Datos/)
duplicados <- c("ANALITICA_Hex.png", "cat.jpg", "Analitica3.png", "HIV.csv")

# Imagenes que ningun capitulo usa
no_usadas <- c("ANALITICA_Hex.jpeg", "CAT.png", "GERKE.png",
               "hex_sticker_cat.pdf", "hex_sticker_cat.png", "sticker_cat.png")

# Imagenes generadas por los chunks (se recrean dentro de img/)
generadas <- c("cilindro_milla.jpg", "hex_sticker_cat.jpg", "hex_meow_software.png")

for (f in c(duplicados, no_usadas, generadas)) a_basura(f)

# .gitignore para las imagenes que los capitulos GENERAN en img/
gen_ignore <- c("img/cilindro_milla.jpg", "img/hex_sticker_cat.jpg",
                "img/hex_meow_software.png")
gi <- if (file.exists(".gitignore")) readLines(".gitignore") else character(0)
nuevas <- setdiff(gen_ignore, gi)
if (length(nuevas)) writeLines(c(gi, nuevas), ".gitignore")

cat("\n==== RAIZ LIMPIA ====\n")
cat("Movidos a _to_delete/:", length(movidos), "\n")
if (length(movidos)) cat(paste0("  - ", movidos), sep = "\n")
cat("\n\nRe-renderiza para confirmar. Si todo sale bien, borra _to_delete/.\n")
