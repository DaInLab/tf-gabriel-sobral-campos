# Instalando biblioteca readxl para importar para o R arquivos com extensão .xls ou .xlsx.
if (!("readxl") %in% installed.packages()) install.packages("readxl")
library(readxl)
covid_19_bauru_mortes <- read_excel("dados/covid_19_bauru_mortes.xlsx")
sort(covid_19_bauru_mortes$idade)
range(covid_19_bauru_mortes$idade, na.rm = TRUE)
AT <- ceiling((max(covid_19_bauru_mortes$idade, na.rm = TRUE)- min(covid_19_bauru_mortes$idade, na.rm = TRUE)))
AT
k <- nclass.Sturges(covid_19_bauru_mortes$idade)
length(covid_19_bauru_mortes$idade)
k <- ceiling((sqrt(length(covid_19_bauru_mortes$idade))))
k
h <- ceiling(AT/k)
h
infclass <- min(covid_19_bauru_mortes$idade, na.rm = TRUE)
supclass <- infclass+(k*h)
brk <-seq(infclass,supclass,h)
tabelaDF_idades<-table(cut(covid_19_bauru_mortes$idade,breaks = brk, right = FALSE))
tabelaDF_idades
hist(covid_19_bauru_mortes$idade, main="Distribuição de Idades", xlab = "Idades", ylab = "Frequência")
axis(1, at=seq(infclass,supclass,h))
axis(2, at=seq(0,max(tabelaDF_idades),2))
