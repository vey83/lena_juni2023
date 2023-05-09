#import
library(tidyverse)


#Loi AVS65
avs65_raw <- read_csv("https://raw.githubusercontent.com/awp-finanznachrichten/lena_september2022/master/Output/AHV_Rentenalter_all_data.csv")

avs65_top <- avs65_raw %>%
  arrange(desc(Ja_Stimmen_In_Prozent)) %>%
  slice(1:50)%>%
  select(Gemeinde_f,Gemeinde_d, Gemeinde_i, Kanton_Short,Ja_Stimmen_In_Prozent) %>%
  mutate(Commune = Gemeinde_f,
         Gemeinde = Gemeinde_d,
         Comune = Gemeinde_i,
         Canton = Kanton_Short,
         Kanton = Kanton_Short,
         Cantone = Kanton_Short,
         "Pourcentage de oui" = Ja_Stimmen_In_Prozent,
         "Ja in %" = Ja_Stimmen_In_Prozent,
         "Percentuale di sì" = Ja_Stimmen_In_Prozent)

write.csv(avs65_top,"Tableaux/AVS65_top.csv", fileEncoding = "UTF-8")


avs65_flop <- avs65_raw %>%
  arrange(Ja_Stimmen_In_Prozent) %>%
  slice(1:50) %>%
  select(Gemeinde_f,Gemeinde_d, Gemeinde_i, Kanton_Short,Ja_Stimmen_In_Prozent) %>%
  mutate(Commune = Gemeinde_f,
         Gemeinde = Gemeinde_d,
         Comune = Gemeinde_i,
         Canton = Kanton_Short,
         Kanton = Kanton_Short,
         Cantone = Kanton_Short,
         "Pourcentage de non" = 100-Ja_Stimmen_In_Prozent,
         "Nein in %" = 100-Ja_Stimmen_In_Prozent,
         "Percentuale di no" = 100-Ja_Stimmen_In_Prozent)

write.csv(avs65_flop,"Tableaux/avs65_flop.csv", fileEncoding = "UTF-8")

#Loi avs_tva
avs_tva_raw <- read_csv("https://raw.githubusercontent.com/awp-finanznachrichten/lena_september2022/master/Output/AHV_Mehrwertsteuer_all_data.csv")

avs_tva_top <- avs_tva_raw %>%
  arrange(desc(Ja_Stimmen_In_Prozent)) %>%
  slice(1:50)%>%
  select(Gemeinde_f,Gemeinde_d, Gemeinde_i, Kanton_Short,Ja_Stimmen_In_Prozent) %>%
  mutate(Commune = Gemeinde_f,
         Gemeinde = Gemeinde_d,
         Comune = Gemeinde_i,
         Canton = Kanton_Short,
         Kanton = Kanton_Short,
         Cantone = Kanton_Short,
         "Pourcentage de oui" = Ja_Stimmen_In_Prozent,
         "Ja in %" = Ja_Stimmen_In_Prozent,
         "Percentuale di sì" = Ja_Stimmen_In_Prozent)

write.csv(avs_tva_top,"Tableaux/avs_tva_top.csv", fileEncoding = "UTF-8")


avs_tva_flop <- avs_tva_raw %>%
  arrange(Ja_Stimmen_In_Prozent) %>%
  slice(1:50) %>%
  select(Gemeinde_f,Gemeinde_d, Gemeinde_i, Kanton_Short,Ja_Stimmen_In_Prozent) %>%
  mutate(Commune = Gemeinde_f,
         Gemeinde = Gemeinde_d,
         Comune = Gemeinde_i,
         Canton = Kanton_Short,
         Kanton = Kanton_Short,
         Cantone = Kanton_Short,
         "Pourcentage de non" = 100-Ja_Stimmen_In_Prozent,
         "Nein in %" = 100-Ja_Stimmen_In_Prozent,
         "Percentuale di no" = 100-Ja_Stimmen_In_Prozent)

write.csv(avs_tva_flop,"Tableaux/avs_tva_flop.csv", fileEncoding = "UTF-8")


##Elevage
elev_raw <- read_csv("https://raw.githubusercontent.com/awp-finanznachrichten/lena_september2022/master/Output/Massentierhaltung_all_data.csv")

elev_top <- elev_raw %>%
  arrange(desc(Ja_Stimmen_In_Prozent)) %>%
  slice(1:50)%>%
  select(Gemeinde_f,Gemeinde_d, Gemeinde_i, Kanton_Short,Ja_Stimmen_In_Prozent) %>%
  mutate(Commune = Gemeinde_f,
         Gemeinde = Gemeinde_d,
         Comune = Gemeinde_i,
         Canton = Kanton_Short,
         Kanton = Kanton_Short,
         Cantone = Kanton_Short,
         "Pourcentage de oui" = Ja_Stimmen_In_Prozent,
         "Ja in %" = Ja_Stimmen_In_Prozent,
         "Percentuale di sì" = Ja_Stimmen_In_Prozent)

write.csv(elev_top,"Tableaux/elev_top.csv", fileEncoding = "UTF-8")


elev_flop <- elev_raw %>%
  arrange(Ja_Stimmen_In_Prozent) %>%
  slice(1:50) %>%
  select(Gemeinde_f,Gemeinde_d, Gemeinde_i, Kanton_Short,Ja_Stimmen_In_Prozent) %>%
  mutate(Commune = Gemeinde_f,
         Gemeinde = Gemeinde_d,
         Comune = Gemeinde_i,
         Canton = Kanton_Short,
         Kanton = Kanton_Short,
         Cantone = Kanton_Short,
         "Pourcentage de non" = 100-Ja_Stimmen_In_Prozent,
         "Nein in %" = 100-Ja_Stimmen_In_Prozent,
         "Percentuale di no" = 100-Ja_Stimmen_In_Prozent)

write.csv(elev_flop,"Tableaux/elev_flop.csv", fileEncoding = "UTF-8")

#Impot anticipe
impo_raw <- read_csv("https://raw.githubusercontent.com/awp-finanznachrichten/lena_september2022/master/Output/Verrechnungssteuer_all_data.csv")

impo_top <- impo_raw %>%
  arrange(desc(Ja_Stimmen_In_Prozent)) %>%
  slice(1:50)%>%
  select(Gemeinde_f,Gemeinde_d, Gemeinde_i, Kanton_Short,Ja_Stimmen_In_Prozent) %>%
  mutate(Commune = Gemeinde_f,
         Gemeinde = Gemeinde_d,
         Comune = Gemeinde_i,
         Canton = Kanton_Short,
         Kanton = Kanton_Short,
         Cantone = Kanton_Short,
         "Pourcentage de oui" = Ja_Stimmen_In_Prozent,
         "Ja in %" = Ja_Stimmen_In_Prozent,
         "Percentuale di sì" = Ja_Stimmen_In_Prozent)

write.csv(impo_top,"Tableaux/impo_top.csv", fileEncoding = "UTF-8")


impo_flop <- impo_raw %>%
  arrange(Ja_Stimmen_In_Prozent) %>%
  slice(1:50) %>%
  select(Gemeinde_f,Gemeinde_d, Gemeinde_i, Kanton_Short,Ja_Stimmen_In_Prozent) %>%
  mutate(Commune = Gemeinde_f,
         Gemeinde = Gemeinde_d,
         Comune = Gemeinde_i,
         Canton = Kanton_Short,
         Kanton = Kanton_Short,
         Cantone = Kanton_Short,
         "Pourcentage de non" = 100-Ja_Stimmen_In_Prozent,
         "Nein in %" = 100-Ja_Stimmen_In_Prozent,
         "Percentuale di no" = 100-Ja_Stimmen_In_Prozent)

write.csv(impo_flop,"Tableaux/impo_flop.csv", fileEncoding = "UTF-8")