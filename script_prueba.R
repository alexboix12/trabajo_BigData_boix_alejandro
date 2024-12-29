#SCRIPT PRUEBA:

install.packages("readxl")
library(readxl)

library(tidyverse)

datos_hoja1 <- read_excel("./datos/DatosLaLiga.xlsx", sheet = "Table 6")

datos_hoja2 <- read_excel("./datos/DatosLaLiga.xlsx", sheet = "Table 2")

datos_hoja3 <- read_excel("./datos/DatosLaLiga.xlsx", sheet = "Table 8")

datos_hoja4 <- read_excel("./datos/DatosLaLiga.xlsx", sheet = "Table 7")

datos_hoja5 <- read_excel("./datos/DatosLaLiga.xlsx", sheet = "Table 5")

datos_hoja6 <- read_excel("./datos/DatosLaLiga.xlsx", sheet = "Table 4")


#construimos una gráfica en la que representemos
#los goles totales de los 15 maximos goleadores de la liga
#teniendo en cuenta el número de partidos que han jugado cada uno de ellos

install.packages("ggplot2")
library(ggplot2)

datos_hoja4 <- datos_hoja4 %>%
  select(Jugador, G., Part.)

gg1 <- ggplot(datos_hoja4, aes(x = reorder(Jugador, G.), y = G.)) +
  geom_bar(stat = "identity", aes(fill = Jugador)) +
  labs(title = "Los 15 máximos goleadores de LaLiga",
       x = "Jugador",
       y = "Número de goles") +
  theme(axis.text.x = element_text(size = 6, angle = 75, hjust = +1)) +
  theme(legend.position = "none")

gg1


gg2 <- ggplot(datos_hoja4, aes(x = reorder(Jugador, Part.), y = Part.)) +
  geom_bar(stat = "identity", aes(fill = Jugador)) +
  geom_point(shape=16, color = "black", size=3) +
  labs(title = "Partidos jugados por los 15 máximos goleadores de LaLiga",
       x = "Jugador",
       y = "Número de partidos jugados") +
  theme(axis.text.x = element_text(size = 6, angle = 75, hjust = +1)) +
  theme(legend.position = "none")

gg2

library(patchwork)

gg1 + gg2


#TABLA:

tabla1 <- gt::gt(datos_hoja5)

tabla1 %>% gtExtras::gt_theme_pff()

#fotos creadas por mi:

url <- "https://www.google.com/search?q=foto+lamine+yamal+jpg&sca_esv=cd32b4dce9376968&rlz=1C1GCEA_enES1072ES1072&udm=2&biw=1280&bih=631&sxsrf=ADLYWIIiTRWkL6ppZQSNnsO4i56TArpcMA%3A1735326438412&ei=5vpuZ5HnGPaI7NYP5o3p0AQ&ved=0ahUKEwiR8rjf0siKAxV2BNsEHeZGGkoQ4dUDCBE&uact=5&oq=foto+lamine+yamal+jpg&gs_lp=EgNpbWciFWZvdG8gbGFtaW5lIHlhbWFsIGpwZ0iWEFC7B1jzDnABeACQAQCYAZIBoAG9AqoBAzIuMbgBA8gBAPgBAZgCA6AC_gHCAgoQABiABBhDGIoFwgIFEAAYgATCAgYQABgHGB7CAgQQABgewgIGEAAYCBgemAMAiAYBkgcDMi4xoAfuCQ&sclient=img#vhid=06cjhnRjseg0qM&vssid=mosaic"

archivo <- here::here("imagenes", "foto_Lamine_Yamal.jpg") 

download.file(url, destfile = archivo)

imagen_LY19 <- "./imagenes/LY19.jpg"
meme::meme(img = imagen_LY19,
           upper = "FUTURA PROMESA",
           lower = "con solo 17 años",
           size = 2.0,
           color = "blue")

imagen_LM10 <- "./imagenes/messi10.jpg"
meme::meme (img = imagen_LM10,
            upper = "El mejor de todos los tiempos",
            lower = "los datos hablan por si solos",
            size = 1.2,
            color = "orange")

imagen_VCF <- "./imagenes/VCF_liga2004.jpg"
meme::meme (img = imagen_VCF,
            upper = "aunque ahora vivamos de recuerdos...",
            lower = "somos el mejor club del mundo!!",
            size = 1.0,
            color = "white")

imagen_LIM <- "./imagenes/lim_go_home.jpg"
meme::meme (img = imagen_LIM,
            upper = "y no puede faltar:",
            lower = "LIM GO HOME!!!!",
            size = 2.0,
            color = "yellow")

imagen_joaquin <- "./imagenes/joaquin_broma.jpg"
meme::meme (img = imagen_joaquin,
            upper = "si es que es",
            lower = "un máquina",
            size = 2.0,
            color = "green")




#tabla dinámica Adrià
Jugador_Regsitros_TOP <- datos_hoja2 %>%
  select(Récord,Primero) 

library(DT) 

datatable(Jugador_Regsitros_TOP, 
          options = list(pageLength = 10, autoWidth = TRUE),
          caption = "Tabla de Récords y Jugadores en la Cima",
          class = "cell-border stripe")

