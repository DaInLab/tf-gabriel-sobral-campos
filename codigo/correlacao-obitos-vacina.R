if (!("readxl") %in% installed.packages()) install.packages("readxl")
library(readxl)
covid_19_bauru_mortes <- read_excel("dados/covid_19_bauru_mortes.xlsx", col_types=c("text"))
covid_19_bauru_mortes[is.na(covid_19_bauru_mortes)] <- c("0")
doses_vacina <- table(covid_19_bauru_mortes$doses_vacina)

barplot(sort(doses_vacina, decreasing=TRUE),
        horiz = TRUE,
        las = 1)
mtext(side = 1, text = "Mortes", line = 2)
mtext(side = 2, text = "Quantidade de Doses", line = 2)
box(bty = "L")
