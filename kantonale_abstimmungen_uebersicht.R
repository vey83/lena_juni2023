kantone_list <- json_data_kantone[["kantone"]]

data_overview <- data.frame(50,50,"Abstimmung_de","Abstimmung_fr","Abstimmung_it")
colnames(data_overview) <- c("Ja","Nein","Abstimmung_de","Abstimmung_fr","Abstimmung_it")

for (k in 1:nrow(kantone_list)) {

vorlagen <- kantone_list$vorlagen[[k]]

for (i in 1:nrow(vorlagen)) {
 
results <- get_results_kantonal(json_data_kantone,
                                  k,
                                  i)
results <- treat_gemeinden(results)
results <- format_data_g(results)

Ja_Stimmen_Kanton <- get_results_kantonal(json_data_kantone,
                                          k,
                                          i,
                                          "kantonal")

#Titel aus Spreadsheet
titel_all <- Kantonale_Vorlagen_Titel %>%
  filter(Kanton == kantone_list$geoLevelname[k],
         Vorlage_ID == vorlagen$vorlagenId[i])

#Eintrag für Uebersicht
uebersicht_text_de <- paste0("<b>",titel_all$Vorlage_d[1],"</b><br>",
                             "Es sind noch keine Gemeinden ausgezählt.")

uebersicht_text_fr <- paste0("<b>",titel_all$Vorlage_f[1],"</b><br>",
                             "Aucun résultat n'est encore connu.")

uebersicht_text_it <- paste0("<b>",titel_all$Vorlage_i[1],"</b><br>",
                             "Nessun risultato è ancora noto.")
Ja_Anteil <- 50
Nein_Anteil <- 50

if (sum(results$Gebiet_Ausgezaehlt) > 0 ) {  
  
  uebersicht_text_de <- paste0("<b>",vorlagen$vorlagenTitel[[i]]$text[1],"</b><br>",
                               sum(results$Gebiet_Ausgezaehlt)," von ",nrow(results)," Gemeinden ausgezählt (",
                               round((sum(results$Gebiet_Ausgezaehlt)*100)/nrow(results),1),
                               "%)")
  
  uebersicht_text_fr <- paste0("<b>",vorlagen$vorlagenTitel[[i]]$text[2],"</b><br>",
                               sum(results$Gebiet_Ausgezaehlt)," des ",nrow(results)," communes sont connus (",
                               round((sum(results$Gebiet_Ausgezaehlt)*100)/nrow(results),1),
                               "%)")
  
  uebersicht_text_it <- paste0("<b>",vorlagen$vorlagenTitel[[i]]$text[3],"</b><br>",
                               sum(results$Gebiet_Ausgezaehlt)," dei ",nrow(results)," comuni sono noti (",
                               round((sum(results$Gebiet_Ausgezaehlt)*100)/nrow(results),1),
                               "%)")
  
  Ja_Anteil <- round(Ja_Stimmen_Kanton,1)
  Nein_Anteil <- round(100-Ja_Stimmen_Kanton,1)
}

entry_overview <- data.frame(Ja_Anteil,Nein_Anteil,uebersicht_text_de,uebersicht_text_fr,uebersicht_text_it)
colnames(entry_overview) <- c("Ja","Nein","Abstimmung_de","Abstimmung_fr","Abstimmung_it")
data_overview <- rbind(data_overview,entry_overview)
}
data_overview <- data_overview[-1,]
write.csv(data_overview,paste0("Output/Uebersicht_dw_",kantone_list$geoLevelname[k],".csv"), na = "", row.names = FALSE, fileEncoding = "UTF-8")

#Update Datawrapper-Chart
dw_data_to_chart(data_overview,datawrapper_codes[1,5])
dw_edit_chart(datawrapper_codes[1,5],intro=paste0("Letzte Aktualisierung: ",format(Sys.time(),"%H:%M Uhr")))
dw_publish_chart(datawrapper_codes[1,5])
}  
