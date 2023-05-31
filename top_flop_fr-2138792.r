library(tidyverse)
library(DatawRappr)

#data

ocde <- read_csv("https://raw.githubusercontent.com/vey83/lena_september2022/master/Output/AHV_Mehrwertsteuer_dw.csv")

climat <- read_csv("https://raw.githubusercontent.com/vey83/lena_september2022/master/Output/AHV_Mehrwertsteuer_dw.csv")  

covid <- read_csv("https://raw.githubusercontent.com/vey83/lena_september2022/master/Output/AHV_Mehrwertsteuer_dw.csv")

top_flop <- function(obj,order,langage) {
  if(order == "top")  {data_top <<- obj %>%
    arrange(desc(Ja_Stimmen_In_Prozent)) %>%
    slice(1:50)
  }
  if(order == "flop") {data_flop <<- obj %>%
    arrange(Ja_Stimmen_In_Prozent) %>%
    slice(1:50)
  }
  if(langage == "fr" & order == "top") {top_fr <<- data_top %>%
    rename(Commune = Gemeinde_KT_f,
           "Pourcentage de oui" = Ja_Stimmen_In_Prozent) %>%
    select(6,3)
  }
  if(langage == "fr" & order == "flop") {flop_fr <<- data_flop %>%
    rename(Commune = Gemeinde_KT_f,
           "Pourcentage de non" = Nein_Stimmen_In_Prozent) %>%
    select(6,4)
  }
  if(langage == "de" & order == "top") {top_de <<- data_top %>%
    rename(Gemeinde = Gemeinde_KT_d,
           "Ja in Prozent" = Ja_Stimmen_In_Prozent) %>%
    select(5,3)
  }
  if(langage == "de" & order == "flop") {flop_de <<- data_flop %>%
    rename(Gemeinde = Gemeinde_KT_d,
           "Nein in Prozent" = Nein_Stimmen_In_Prozent) %>%
    select(5,4)
  }
  if(langage == "it" & order == "top") {top_it <<- data_top %>%
    rename(Municipio = Gemeinde_KT_i,
           "Per cento sì" = Ja_Stimmen_In_Prozent) %>%
    select(7,3)
  }
  if(langage == "it" & order == "flop") {flop_it <<- data_flop %>%
    rename(Municipio = Gemeinde_KT_i,
           "Per cento no" = Nein_Stimmen_In_Prozent) %>%
    select(7,4)
  }
}

top_flop(covid,"top","it")
