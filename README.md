---
permalink: /index.html
---

# Ciencia de Datos con R — BIOL4026

Libro digital del curso **BIOL4026 (Ciencia de Datos con R)**, un curso electivo
de la Universidad de Puerto Rico en Humacao, del Dr. Raymond L. Tremblay.

**Sitio publicado:** https://raymondltremblay.github.io/Ciencia_Datos_R/

Es una introducción a la ciencia de datos con R, RStudio, RMarkdown y Quarto,
diseñada para estudiantes sin experiencia previa en programación. Está construido
con [**bookdown**](https://bookdown.org/) y se basa en *R for Data Science*
(Grolemund & Wickham).

## Contenido

El libro cubre el flujo completo de trabajo con datos: importar, ordenar,
transformar y visualizar con el `tidyverse`; además de cadenas de texto, factores,
fechas, mapas interactivos, ecuaciones matemáticas, y una introducción a
**funciones**, **iteración con `purrr`** y **modelos con `modelr`**.

## Instalar los paquetes

Antes de correr los capítulos, instala los paquetes del curso. Abre
[`instalar_paquetes.R`](instalar_paquetes.R) en RStudio y presiona **Source**, o
en la consola:

```r
source("instalar_paquetes.R")
```

Solo instala los paquetes que falten; es seguro correrlo varias veces. La página
*Instalación de paquetes* (primer capítulo del libro) contiene el mismo script.

## Construir el libro

Desde la raíz del proyecto, en R:

```r
bookdown::render_book()   # genera el sitio en la carpeta docs/
```

El orden de los capítulos se controla en `_bookdown.yml` (la lista `rmd_files:`).
El formato de salida está en `_output.yml` (`bookdown::gitbook`).
