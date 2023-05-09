#Bibliotheken laden
library(dplyr)
library(tidyr)
library(purrr)
library(readr)
library(ggplot2)
library(stringr)
library(stringi)
library(xml2)
library(rjson)
library(jsonlite)
library(readxl)
library(git2r)
library(DatawRappr)
library(lubridate)

cat("Benoetigte Bibliotheken geladen\n")

#Welche Abstimmung?
abstimmung_date <- "Juni2023"

link_json <- "https://app-prod-static-voteinfo.s3.eu-central-1.amazonaws.com/v1/ogd/sd-t-17-02-20230618-eidgAbstimmung.json" 
json_data <- fromJSON(link_json, flatten = TRUE)

link_json_kantone <- "https://app-prod-static-voteinfo.s3.eu-central-1.amazonaws.com/v1/ogd/sd-t-17-02-20230618-kantAbstimmung.json"
json_data_kantone <- fromJSON(link_json_kantone, flatten = TRUE)

cat("Aktuelle Abstimmungsdaten geladen\n")

#Kurznamen Vorlagen (Verwendet im File mit den Textbausteinen)
vorlagen_short <- c("OECD_Mindeststeuer","Klima_Gesetz","Covid_Gesetz")

###Kurznamen und Nummern kantonale Vorlagen
kantonal_short <- c("SZ_Regierungsratslöhne","VS_Familienzulagen","VS_Suizid")

#Nummer in JSON 
kantonal_number <- c(2,8,8) 

#Falls mehrere Vorlagen innerhalb eines Kantons, Vorlage auswaehlen
kantonal_add <- c(1,1,2)

###Kurznamen und Nummern kantonale Vorlagen Spezialfaelle
#kantonal_short_special <- c("ZH_Krankenkassen","BS_Klimagerechtigkeit")

#Nummer in JSON 
#kantonal_number_special <- c(1,4) 

#Falls mehrere Vorlagen innerhalb eines Kantons, Vorlage auswaehlen
#kantonal_add_special <- c(1,1)

#Spezialfälle
other_check <- FALSE

###Vorhandene Daten laden
#daten_altersvorsorge_bfs <- read_excel("Data/daten_altersvorsorge_bfs.xlsx")

#cat("Daten zu historischen Abstimmungen geladen\n")

#Metadaten Gemeinden und Kantone
meta_gmd_kt <- read_csv("Data/MASTERFILE_GDE.csv")

cat("Metadaten zu Gemeinden und Kantonen geladen\n")

#Datawrapper-Codes
datawrapper_codes <- as.data.frame(read_excel("Data/metadaten_grafiken.xlsx"))
datawrapper_codes_kantonal <- as.data.frame(read_excel("Data/metadaten_grafiken_kantonal.xlsx"))
datawrapper_codes_kantonal <- datawrapper_codes_kantonal[,c(1:5)]

datawrapper_auth(Sys.getenv("DW_KEY"), overwrite = TRUE)

gitcommit <- function(msg = "commit from Rstudio", dir = getwd()){
  cmd = sprintf("git commit -m\"%s\"",msg)
  system(cmd)
}

gitstatus <- function(dir = getwd()){
  cmd_list <- list(
    cmd1 = tolower(substr(dir,1,2)),
    cmd2 = paste("cd",dir),
    cmd3 = "git status"
  )
  cmd <- paste(unlist(cmd_list),collapse = " & ")
  shell(cmd)
}

gitadd <- function(dir = getwd()){
  cmd_list <- list(
    cmd1 = tolower(substr(dir,1,2)),
    cmd2 = paste("cd",dir),
    cmd3 = "git add --all"
  )
  cmd <- paste(unlist(cmd_list),collapse = " & ")
  shell(cmd)
}

gitpush <- function(dir = getwd()){
  cmd_list <- list(
    cmd1 = tolower(substr(dir,1,2)),
    cmd2 = paste("cd",dir),
    cmd3 = "git push"
  )
  cmd <- paste(unlist(cmd_list),collapse = " & ")
  shell(cmd)
}


