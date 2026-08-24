library(tidyverse)
library(dplyr)
library(sf)
library(highcharter)



#Capacitaciones--------------

capacitaciones <- data.frame(
  efector = c("H. Picún Leufú", "Subsecretaría", "CS Confluencia", "CS San Lorenzo Sur", "CS Villa Florencia", "CS Valentina Sur", 
              "CS Parque Industrial","CS Valentina Norte Rural", "CS San Lorenzo Norte", "CS Progreso", "CS V.Farrel","CS M. Moreno",
              "CS Valentina Norte", "CS Nueva Esperanza","H. Heller","H.Chos Malal","H. Cutral Co-Plaza Huincul","H.Centenario","H. J.de los Andes",
              "H.V.La Angostura", "H.Plottier","H.B.Roldán"),
  capacitaciones = c(2, 1, 4,6,4,1,4,3,7,5,2,3,2,2,6,3,8,6,4,4,4,7))


#objeto total capacitaciones
cantidad_capacitados <- capacitaciones %>% 
  summarise(total = sum(capacitaciones))

view(cantidad_capacitados)

#grafico capacitaciones por efector

# Ordenar de mayor a menor
capacitaciones_ordenadas <- capacitaciones %>%
  arrange(desc(capacitaciones))

grafico_capacitaciones <- highchart() %>%
  hc_chart(type = "bar") %>%
  hc_title(
    text = "Capacitaciones <i>\"Gestión del cuidado en patologías estacionales\"<i> según efector de origen. Plan invierno 2026, provincia del Neuquén. N=88",
    align = "left",
    style = list(
      fontFamily = "Montserrat",
      fontSize = "20px",
      fontWeight = "bold")) %>%
  hc_xAxis(
    categories = capacitaciones_ordenadas$efector,
    title = list(text = NULL)) %>%
  hc_yAxis(
    title = list(text = "Trabajadores capacitados"),
    gridLineWidth = 0,
    allowDecimals = FALSE) %>%
  hc_add_series(
    name = "Capacitaciones",
    data = capacitaciones_ordenadas$capacitaciones,
    color = "#70A9A1",
    style = list(
        fontFamily = "Montserrat",
        fontWeight = "bold",
        textOutline = "none")) %>%
  hc_legend(enabled = FALSE) %>%
  hc_caption(
    text = "Elaboración propia.",
    align = "left",
    style = list(
      fontFamily = "Montserrat",
      fontSize = "11px",
      color = "#666666"))

grafico_capacitaciones









